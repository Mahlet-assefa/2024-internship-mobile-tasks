import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String price;
  final String description;
  final String imgurl;

  const Product(
      {
      required this.id,
      required this.name,
      required this.category,
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
}
