import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<Product>>> getallproduct();
  Future<Either<Failure, void>> addproduct(Product product);
  Future<Either<Failure, void>> deleteproduct(String id);
  Future<Either<Failure, Product>> updateproduct({required String id,required String name,required String description,required String price});
  Future<Either<Failure, Product>> getproductbyid(String id);
}
