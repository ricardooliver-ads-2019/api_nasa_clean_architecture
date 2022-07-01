
import 'dart:convert';

import 'package:nasa_clean_arch/core/errors/execeptions.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';
import 'package:nasa_clean_arch/core/utils/converters/date_to_string_converter.dart';
import 'package:nasa_clean_arch/core/utils/nasa_api_keys.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/i_space_media_datasource.dart';

class NasaSpaceMediaDatasourceImpl implements ISpaceMediaDatasource {
  final HttpClient client;
  final NetworkInfo networkInfo;

  NasaSpaceMediaDatasourceImpl({required this.networkInfo, required this.client});
  @override
  Future<HttpResponse> getSpaceMediaFromDate(DateTime date) async{
    if ( await networkInfo.isConnected) {

    try {
      final response =  await client.get(NasaEndpoints.apod(NasaApiKeys.api_key, DataToStringConverter.convert(date)));
      print((jsonDecode(response.data)));
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      //print(SpaceMediaModel.fromJson(jsonDecode(response.data)));
      if(response.statusCode != 200){
        return ResponseError(statusCode: response.statusCode!, code: json['error']['code'], message: json['error']['message']);
      }
      return response;
     
    } catch(e) {
      //print('---------------------');
      //print(e);
      // print(s); 
      rethrow;
      
    }
     } else{
      return NoConnectFailure(error: 00, message: 'Humm! Parece que você está sem conexão');
    } 
  }
   
}