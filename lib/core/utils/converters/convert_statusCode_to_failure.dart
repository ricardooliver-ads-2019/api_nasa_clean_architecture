import 'package:nasa_clean_arch/core/errors/failures.dart';


class ConvertStatuscodeToFailure {
  static Failure convertStatusCodeToFailure(String statusCode){
    int statusCodeInt = int.parse(statusCode);
    
    if(statusCodeInt == 403){
      return AccessIsRestrictedFailure();
    }else if(statusCodeInt == 404){
      return NotFoundFailure();
    }else if((statusCodeInt >= 500) && (statusCodeInt < 600)){
      return ServerFailure();
    }else{
      return NotIdentifiedFailure(error: statusCodeInt);
    }
    
  }
}