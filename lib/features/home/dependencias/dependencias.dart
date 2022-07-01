import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_clean_arch/core/http_client.dart/http_client.impl.dart';
import 'package:nasa_clean_arch/core/networkInfo/network_info.dart';
import 'package:nasa_clean_arch/core/usecase/usecase.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/i_space_media_datasource.dart';
import 'package:nasa_clean_arch/features/home/data/datasources/nasa_space_media_datasource_impl.dart';
import 'package:nasa_clean_arch/features/home/data/repositories/space_media_repository_impl.dart';
import 'package:nasa_clean_arch/features/home/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_arch/features/home/domain/usecase/get_space_media_from_date_usecase.dart';
import 'package:nasa_clean_arch/features/home/presenter/cubitController/cubit_controller.dart';

import '../../../core/http_client.dart/http_client.dart';

GetIt getItDependencia = GetIt.instance;

Future<void> getItDependencias() async{
  getItDependencia.registerSingleton<DataConnectionChecker>(DataConnectionChecker());

  getItDependencia.registerSingleton<NetworkInfo>(NetworkInfoImpl(connectionCheker: getItDependencia<DataConnectionChecker>()));

  getItDependencia.registerLazySingleton<HttpClient>(() => HttpClientImpl());

  getItDependencia.registerLazySingleton<ISpaceMediaDatasource>(() => NasaSpaceMediaDatasourceImpl(client: getItDependencia.get<HttpClient>(), networkInfo: getItDependencia<NetworkInfo>()));

  getItDependencia.registerLazySingleton<ISpaceMediaRepository>(() => SpaceMediaRepositoryImpl(datasource: getItDependencia<ISpaceMediaDatasource>()));

  getItDependencia.registerLazySingleton<Usecase>(()=> GetSpaceMediaFromDateUsecase(getItDependencia.get<ISpaceMediaRepository>()));

  // --- cubit
  getItDependencia.registerFactory<CubitController>(() => CubitController(usecase: GetIt.instance<Usecase>()));
}
