import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/product_model.dart';
import 'package:http_parser/http_parser.dart';

abstract class ProductRemoteDataSources {
  Future<List<ProductModel>> getallproduct();
  Future<ProductModel> getproductbyid(String id);
  Future<void> deleteproduct(String id);
  Future<ProductModel> updateproduct(
      {required String id,
      required String name,
      required String description,
      required String price});
  Future<void> addProduct(ProductModel productModel);
}

class ProductRemoteDataSourcesImpl extends ProductRemoteDataSources {
  final http.Client client;
  ProductRemoteDataSourcesImpl({required this.client});
  final baseurl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  @override
  Future<List<ProductModel>> getallproduct() async {
    final response = await client.get(
      Uri.parse(baseurl),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      List<ProductModel> product = [];
      for (var i in jsonData['data']) {
        product.add(ProductModel.fromJson(i));
      }

      return product;
    } else {
      throw ServerException('server failure');
    }
  }

  @override
  Future<ProductModel> getproductbyid(String id) async {
    final response = await client.get(
      Uri.parse(baseurl),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return ProductModel.fromJson(jsonData['data']);
    } else {
      throw ServerException('server failure');
    }
  }

  @override
  Future<void> deleteproduct(String id) async {
    final response = await client.delete(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
      headers: null,
    );
    if (response.statusCode != 200) {
      throw ServerException('server failure');
    }
  }

  @override
  Future<ProductModel> updateproduct(
      {required String id,
      required String name,
      required String description,
      required String price}) async {
    final response = await client.put(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'description': description,
          'price': int.parse(price),
        }));
    print("mahi's update${response.body}");
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final pro = ProductModel.fromJson(jsonData['data']);
      return pro;
    } else {
      throw ServerException('server failure');
    }
  }

  @override
  Future<void> addProduct(ProductModel productModel) async {
    try {
      File imageFile = File(productModel.imgurl);
      List<int> imageBytes = await imageFile.readAsBytes();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
      );

      request.fields.addAll({
        'name': productModel.name,
        'description': productModel.description,
        'price': productModel.price,
      });

      request.files.add(http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: 'fg.jpg',
        contentType: MediaType('image', 'jpeg'),
      ));

      http.StreamedResponse response = await request.send();

      print('Response code: ${response.statusCode}');

      if (response.statusCode == 201) {
        print('Success: ${await response.stream.bytesToString()}');
      } else {
        print('Failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error during addProduct: $e');
    }
  }
}
