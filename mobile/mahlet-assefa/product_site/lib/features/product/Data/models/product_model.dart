import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    super.category,
    required super.imgurl,
    required super.price,
    
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '', 
      name: json['name'] ?? '', 
      description: json['description'] ?? '', 
      category: json['category'], 
      imgurl: json['imageUrl'] ?? '', // Default to an empty string if null
      price: json['price'].toString(),
    );
  }

  // @override
  // ignore: override_on_non_overriding_member
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      // 'category': category,
      'imgurl':imgurl,
      'price': price,
      
    };
  }

   Product toEntity() {
    return Product(
      id: id,
      name: name,
      category: category,
      description: description,
      imgurl: imgurl,
      price: price,
    );
  }
  
}

