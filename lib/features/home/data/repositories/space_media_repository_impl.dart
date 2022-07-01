
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nasa_clean_arch/core/errors/execeptions.dart';

import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';
import 'package:nasa_clean_arch/core/utils/converters/convert_statusCode_to_failure.dart';
import 'package:nasa_clean_arch/features/home/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/home/domain/entities/space_media_entipy.dart';
import 'package:nasa_clean_arch/features/home/domain/repositories/space_media_repository.dart';

import '../datasources/i_space_media_datasource.dart';

class SpaceMediaRepositoryImpl implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;
  SpaceMediaRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async{
      

        final result = await datasource.getSpaceMediaFromDate(date);
        if(result is ResponseError){
          return Left(ErroFailure(error: result.statusCode, message: result.message));
        }
        try {    
          final spaceMedia = SpaceMediaModel.fromJson(jsonDecode(result.data));
          print(spaceMedia.mediaType);
          print(spaceMedia.mediaUrl);
          return Right(spaceMedia);
        } catch (e){
          return Left(ErroFailure(message: 'Erro de converção', error: 400));
        }
    
  }
  
}
