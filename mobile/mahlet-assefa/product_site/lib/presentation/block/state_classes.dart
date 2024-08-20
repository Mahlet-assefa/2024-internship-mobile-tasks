import 'package:equatable/equatable.dart';
import '../../features/product/domain/entities/product.dart';

class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class InitialState extends ProductState {

}

class LoadingState extends ProductState {

}
class AddedState extends ProductState {

}

class LoadedState extends ProductState {
  final List<Product> products;

  const LoadedState(this.products);

  @override
  List<Object> get props => [products];
}
class LoadedAllProductState extends ProductState {
  final List<Product> products;

  const LoadedAllProductState(this.products);

  @override
  List<Object> get props => [products];
}


class LoadedSingleProductState extends ProductState {

  final Product product;

  const LoadedSingleProductState(this.product);

  @override
  List<Object> get props => [product];
}

class CreatedProductState extends ProductState {
  final String message;
  const CreatedProductState(this.message);

  @override
  List<Object> get props => [message];
}
class ErrorState extends ProductState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
class DeletedProductState extends ProductState {
  final String message;

  const DeletedProductState(this.message);

  @override
  List<Object> get props => [message];
}
