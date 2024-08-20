import 'package:equatable/equatable.dart';

import '../../Data/models/product_model.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String? category;
  final String price;
  final String description;
  final String imgurl;

  const Product(
      {
      required this.id,
      required this.name,
      this.category,
      required this.description,
      required this.imgurl,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imgurl,
        price,
      ];

  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      category: category,
      description: description,
      imgurl: imgurl,
      price: price,
    );
  }
}
