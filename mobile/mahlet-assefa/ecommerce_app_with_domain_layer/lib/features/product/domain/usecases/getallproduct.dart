import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Getallproductusecase {
  final ProductRepositories productRepositories;

  Getallproductusecase(this.productRepositories);
  Future<Either<Failure, List<Product>>> execute() {
    return productRepositories.getallproduct();
  }
}
