
import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}


class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionCheker;

  NetworkInfoImpl({
    required this.connectionCheker,
  });
  
  @override
  Future<bool> get isConnected => connectionCheker.hasConnection;
  
}
