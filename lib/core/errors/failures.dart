import 'package:equatable/equatable.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.dart';
import 'package:nasa_clean_arch/core/utils/message_erro.dart';

abstract class Failure extends Equatable{

  final String message;
  final dynamic error;
  Failure({
    required this.message,
    required this.error,
  });
  @override
  List<Object?> get props => [message, error];
  
}





class NoConnectFailure extends HttpResponse{
  NoConnectFailure({message = MessageErro.noConnection, error = 00}) : super(data: '', statusCode: 00);


}

class AccessIsRestrictedFailure extends Failure {
  AccessIsRestrictedFailure({super.message = MessageErro.erro403, super.error = 403});

}

class NotFoundFailure extends Failure {
  NotFoundFailure({super.message = MessageErro.erro404, super.error = 404});

}


class ServerFailure extends Failure {
  ServerFailure({super.message = MessageErro.erro500, super.error = 500});

}

class NotIdentifiedFailure extends Failure {
  NotIdentifiedFailure({super.message = MessageErro.notIdentified, required super.error});

}

class ErroFailure extends Failure{
 
  ErroFailure({required super.message,  required super.error});
}