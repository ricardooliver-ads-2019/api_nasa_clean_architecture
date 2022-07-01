import 'package:equatable/equatable.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';

class ServerException extends Equatable implements Exception{
  @override
  List<Object?> get props => [];
}

class NotFoundException extends Equatable implements Exception{
  @override
  List<Object?> get props => [];
}

class NoConnectionException extends Equatable implements Exception{
  @override
  List<Object?> get props => [];
}

class ErrorException extends Equatable implements Exception{
  @override
  List<Object?> get props => [];
}

class ResponseError extends HttpResponse{
  String code;
  String message;
  ResponseError({
    this.code ='',
    this.message = '',
    final dynamic data,
    final int? statusCode,
  }):super(data: data, statusCode: statusCode);

 factory ResponseError.fromJson(Map<String,dynamic> json){
   return ResponseError(
     code: json['code'],
     message: json['message'],
   );
 }

}

// class ResponseSuccess extends HttpResponse{
//   ResponseSuccess({required super.data, required super.statusCode});

//   factory ResponseSuccess.jsonDecode(joson)

// }
