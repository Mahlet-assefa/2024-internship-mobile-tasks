import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repositories.dart';

class Updateproductusecase {
  final ProductRepositories productRepositories;
  Updateproductusecase(this.productRepositories);
  Future<Either<Failure, Product>> execute({required String id,required String name,required String description,required String price}) {
    return productRepositories.updateproduct(id:id,name: name,description: description,price: price);
  }
}
