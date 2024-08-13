import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSources {
  Future<List<ProductModel>> getallproduct();
  Future<ProductModel> getproductbyid(String id);
  Future<void> deleteproduct(String id);
  Future<ProductModel> updateproduct(
      {required String id,
      required String name,
      required String description,
      required String price});
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
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: null,
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
        }));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final pro = jsonData['data'];
      return pro;
    }
    else{
      throw ServerException('server failure');
    }
  }
}
