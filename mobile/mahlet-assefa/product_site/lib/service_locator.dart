// import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/product/Data/data_sources/local_data_source.dart';
import 'features/product/Data/data_sources/remote_data_source.dart';
import 'features/product/Data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repositories.dart';
import 'features/product/domain/usecases/addproduct.dart';
import 'features/product/domain/usecases/deleteproduct.dart';
import 'features/product/domain/usecases/getallproduct.dart';
import 'features/product/domain/usecases/getproductbyid.dart';
import 'features/product/domain/usecases/updateproduct.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final client = http.Client();
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(()=>sharedPreferences);
  getIt.registerLazySingleton<http.Client>(()=> client);
  getIt.registerLazySingleton<InternetConnectionChecker>(()=>connectionChecker);
  getIt.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSources>(()=>
      ProductRemoteDataSourcesImpl(client: getIt()));
  getIt.registerLazySingleton<localDataSource>(()=>
      localDataSourceImpl(sharedPreference:sharedPreferences));
  getIt.registerLazySingleton<ProductRepositories>(()=>ProductRepositoryImpl(
      localDataSources: getIt(),
      productRemoteDataSources: getIt(),
      networkInfo: getIt()));
  // getIt.registerLazySingleton<Getallproductusecase>(Getallproductusecase(getIt<ProductRepositories>()) as FactoryFunc<Getallproductusecase>);
  getIt.registerLazySingleton<Getallproductusecase>(()=>
      Getallproductusecase(getIt<ProductRepositories>()));
  getIt.registerLazySingleton<Getproductbyidusecase>(()=>
      Getproductbyidusecase(getIt<ProductRepositories>()));
  getIt.registerLazySingleton<Updateproductusecase>(()=>
      Updateproductusecase(getIt<ProductRepositories>()));
  getIt.registerLazySingleton<Deleteproductusecase>(()=>
      Deleteproductusecase(getIt<ProductRepositories>()));
  getIt.registerLazySingleton<Addproductusecase>(()=>
      Addproductusecase(getIt<ProductRepositories>()));
  // print("hi");
}
