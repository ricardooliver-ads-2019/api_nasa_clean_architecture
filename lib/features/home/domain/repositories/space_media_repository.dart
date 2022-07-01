import 'package:dartz/dartz.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/features/home/domain/entities/space_media_entipy.dart';

abstract class ISpaceMediaRepository{
 Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}