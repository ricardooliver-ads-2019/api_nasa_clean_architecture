
import 'package:dartz/dartz.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';

import '../models/space_media_model.dart';

abstract class ISpaceMediaDatasource {
  Future<HttpResponse> getSpaceMediaFromDate(DateTime date);
}