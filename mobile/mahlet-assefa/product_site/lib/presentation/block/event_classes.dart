import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

class LoadAllProductEvent extends ProductEvent {
  const LoadAllProductEvent();
  @override
  List<Object> get props => [];
}

class GetSingleProductEvent extends ProductEvent {
  final String id;
  const GetSingleProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateProductEvent extends ProductEvent {
  final String name;
  final String category;
  final String price;
  final String id;
  const UpdateProductEvent({
    required this.name,
    required this.category,
    required this.price,
    required this.id,
  });
}

class DeleteProductEvent extends ProductEvent {
  final String id;
  const DeleteProductEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class CreateProductEvent extends ProductEvent {
  final String name;
  final String category;
  final String price;
  final String description;
  final String imgurl;
  const CreateProductEvent({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imgurl,
  });

  // final Map<String, dynamic> productData;

  // const CreateProductEvent(this.productData);

  // @override
  // List<Object?> get props => [productData];
}
