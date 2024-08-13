import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Addproductusecase {
  final ProductRepositories productRepositories;
  Addproductusecase(this.productRepositories);
  Future<Either<Failure, void>> call(Product product) {
    return productRepositories.addproduct(product);
  }
}
