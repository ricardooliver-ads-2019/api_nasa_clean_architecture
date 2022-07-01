// ignore_for_file: prefer_const_declarations

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/execeptions.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/i_space_media_datasource.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/nasa_space_media_datasource_impl.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient{}

void main() {
  DataConnectionChecker connectionCheker;
  late ISpaceMediaDatasource datasource;
  NetworkInfo mockNetworkInfo;
  late HttpClient client;

  setUp((){
     
    connectionCheker = DataConnectionChecker();
    mockNetworkInfo = NetworkInfoImpl(connectionCheker: connectionCheker);

    client = HttpClientMock();
    datasource = NasaSpaceMediaDatasourceImpl(client:client, networkInfo: mockNetworkInfo );

  });

  final tDateTime = DateTime(2021, 02, 02);
  final urlExpected = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-02-02';
  test('should call the get method with corret url', () async{
     //Arrange
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
   
    //Act
    await datasource.getSpaceMediaFromDate(tDateTime);

    // Assert
    verify(() => client.get(urlExpected)).called(1);

  });

  test('should return a SpaceMediaModel when is Successful', () async{
     //Arrange
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    final tSpaceMediaModelExpected = SpaceMediaModel(description: "Can you create a planetary system that lasts for 1000 years? Super Planet Crash, the featured game, allows you to try.  To create up to ten planets, just click anywhere near the central star.", mediaType: "video", title: "Game: Super Planet Crash", mediaUrl: "https://stefanom.org/spc/game.php",);
    //Act
    final result = await datasource.getSpaceMediaFromDate(tDateTime);
    await datasource.getSpaceMediaFromDate(tDateTime);

    // Assert
    expect(result, tSpaceMediaModelExpected);

  });

   test('should throw a SeverExeception when the call is uccessful', () async{
     //Arrange
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: 'something went wrong', statusCode: 404));
    //Act
    final result = datasource.getSpaceMediaFromDate(tDateTime);
    //await datasource.getSpaceMediaFromDate(tDateTime);

    // Assert
    expect( ()=> result, throwsA(NotFoundException()));

  });
}