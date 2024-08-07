import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepositories {
  Future<Either<Failure, List<Product>>> getallproduct();
  Future<Either<Failure, void>> addproduct(Product product);
  Future<Either<Failure, Product>> deleteproduct(String id);
  Future<Either<Failure, Product>> updateproduct(String id);
  Future<Either<Failure, Product>> getproductbyid(String id);
}
