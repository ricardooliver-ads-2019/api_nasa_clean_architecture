import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/home/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_arch/features/home/domain/usecase/get_space_media_from_date_usecase.dart';



class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository{}
void main(){
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  final tSapceMedia = SpaceMediaModel(description: 'imagem muito top', mediaType: 'image', title: 'titulo da imagem', mediaUrl: 'http://google.com');

  setUp((){
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tDate = DateTime(2021, 02, 02);
  test('should get space media entipy for a given date from the repository', 
    () async{
      when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer((_) async => Right(tSapceMedia));
      final result = await usecase(tDate);
      expect(result, Right(tSapceMedia));
      verify(()=> repository.getSpaceMediaFromDate(tDate));
    });

    test('should return a failure when don\'t succed', 
    () async{
      when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer((_) async => Left(ServerFailure(error: 0, message: '')));
      final result = await usecase(tDate);
      expect(result, Left(ServerFailure(error: 0, message: '')));
      verify(()=> repository.getSpaceMediaFromDate(tDate));
    });
}

