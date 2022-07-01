import 'package:nasa_clean_arch/core/utils/message_erro.dart';

class ConvertStatusCodeToMessage {
  static String convertStatusCodeToMessage(String statusCode){
    var message = '';
    int statusCodeInt = int.parse(statusCode);
    
    if(statusCodeInt == 403){
      return MessageErro.erro403;
    } else if(statusCodeInt == 404){
      return MessageErro.erro404;
    }else if((statusCodeInt >= 500) && (statusCodeInt < 600)){
      return MessageErro.erro500;
    }else{
      return MessageErro.notIdentified;
    }
    
  }

  

  
}