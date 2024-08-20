import 'dart:io';

import 'package:dartz/dartz.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import '../../../../../test/helpers/test_helper.mocks.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repositories.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepositories {
  final ProductRemoteDataSources productRemoteDataSources;
  late NetworkInfo networkInfo;
  late localDataSource localDataSources;

  ProductRepositoryImpl(
      {required this.productRemoteDataSources,
      required this.localDataSources,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Product>>> getallproduct() async {
    try {
      if (await networkInfo.isConnected) {
        final result = await productRemoteDataSources.getallproduct();
        final products = result.map((product) => product.toEntity()).toList();
        // localDataSource.cacheProducts(products);
        return Right(products);
      } else {
        // return localDataSource.getLastProducts();
        return const Left(ConnectionFailure('No internet connection'));
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Product>> getproductbyid(String id) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await productRemoteDataSources.getproductbyid(id);
        return Right(result);
      } else {
        // return localDataSource.getLastProducts();
        return const Left(ConnectionFailure('No internet connection'));
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteproduct(String id) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await productRemoteDataSources.deleteproduct(id);
        return Right(result);
      } else {
        // return localDataSource.getLastProducts();
        return const Left(ConnectionFailure('No internet connection'));
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occured'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Product>> updateproduct(
      {required String id,
      required String name,
      required String description,
      required String price}) async {
    final result = await productRemoteDataSources.updateproduct(
        id: id, name: name, description: description, price: price);

    return Right(result.toEntity());
  }

  @override
  Future<Either<Failure, void>> addproduct(Product product) async {
    try {
      if (await networkInfo.isConnected) {
        ProductModel productModel = product.toModel();
        await productRemoteDataSources.addProduct(productModel);
        return const Right(unit);
      } else {
        // return localDataSource.getLastProducts();
        return const Left(ConnectionFailure('No internet connection'));
      }
    } on ServerException {
      return const Left(ServerFailure('An error has occured'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}


        // @override
        // Future<Either<Failure, Product>> updateproduct(
        //     {required String id,
        //     required String name,
        //     required String description,
        //     required String price}) {
        //   // TODO: implement updateproduct
        //   throw UnimplementedError();
        // }

