import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Getproductbyidusecase {
  final ProductRepositories productRepositories;
  Getproductbyidusecase(this.productRepositories);
  Future<Either<Failure, Product>> execute(String id) {
    return productRepositories.getproductbyid(id);
  }

}
