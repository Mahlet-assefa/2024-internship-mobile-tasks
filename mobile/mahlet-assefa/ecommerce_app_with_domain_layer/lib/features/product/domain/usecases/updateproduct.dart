import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Updateproductuecase {
  final ProductRepositories productRepositories;
  Updateproductuecase(this.productRepositories);
  Future<Either<Failure, Product>> execute(String id) {
    return productRepositories.updateproduct(id);
  }
}
