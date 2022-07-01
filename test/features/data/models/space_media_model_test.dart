import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/home/domain/entities/space_media_entipy.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      description: 'Can you create a planetary system that lasts for 1000 years? Super Planet Crash, the featured game, allows you to try.  To create up to ten planets, just click anywhere near the central star.',
      mediaType: 'video',
      title: 'Game: Super Planet Crash',
      mediaUrl: 'https://stefanom.org/spc/game.php'
  );

  test('é uma sub classe de SpaceMediaEntipy', (){
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', (){
    //Arrange

    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    //Act
    final result = SpaceMediaModel.fromJson(jsonMap);
    // Assert
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', (){
    //Arrange

    final expectedMap = {
          "explanation": "Can you create a planetary system that lasts for 1000 years? Super Planet Crash, the featured game, allows you to try.  To create up to ten planets, just click anywhere near the central star.",
          "media_type": "video",
          "title": "Game: Super Planet Crash",
          "url": "https://stefanom.org/spc/game.php"
    };
    //Act
    final result = tSpaceMediaModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
