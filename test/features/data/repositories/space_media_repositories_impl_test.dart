import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/execeptions.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/i_space_media_datasource.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/home/data/repositories/space_media_repository_impl.dart';


class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource{}
class MockNetworkInfo extends Mock implements NetworkInfo {}
void main(){
  
  late SpaceMediaRepositoryImpl repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
   
    repository = SpaceMediaRepositoryImpl(datasource: datasource);
  });
  final tDate = DateTime(2021, 02, 02);
  final tSpaceMediaModel = SpaceMediaModel(description: 'test descrição', mediaType: 'mediaType', title: 'title', mediaUrl: 'mediaUrl');

  test('chamando o Datasource e respondendo com o modelo', () async{
    // Arrange
    when(()=> datasource.getSpaceMediaFromDate(tDate)).thenAnswer((_) async => HttpResponse(data: '', statusCode: 400));
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, Right(tSpaceMediaModel));
  });

  test('deve retornar um server erro quando chamar o datasource e não ter succeed', () async{
    // Arrange
    when(()=> datasource.getSpaceMediaFromDate(tDate)).thenThrow(ServerException());
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, Left(ServerFailure(message: 'Servidor está passando por alguns problemas!', error: 500)));
  });
}