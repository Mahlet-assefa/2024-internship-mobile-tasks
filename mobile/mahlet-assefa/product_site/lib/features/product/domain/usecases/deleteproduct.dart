import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
// import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Deleteproductusecase {
  final ProductRepositories productRepositories;
  Deleteproductusecase(this.productRepositories);
  Future<Either<Failure, void>> execute( String id) {
    return productRepositories.deleteproduct(id);
  }
}
