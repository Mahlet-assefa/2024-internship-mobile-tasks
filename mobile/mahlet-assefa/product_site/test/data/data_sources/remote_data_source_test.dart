import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:product_site/core/error/exception.dart';
import 'package:product_site/features/product/Data/data_sources/remote_data_source.dart';
import 'package:product_site/features/product/Data/models/product_model.dart';
import 'package:product_site/features/product/domain/entities/product.dart';
// import 'package:product_site/features/product/domain/entities/product.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourcesImpl productRemoteDataSourcesImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourcesImpl =
        ProductRemoteDataSourcesImpl(client: mockHttpClient);
  });

  final product = ProductModel.fromJson(const {
    'id': '6672940692adcb386d593686',
    "name": "PC",
    "description": "long description",
    "price": 123,
    "imageUrl":
        "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718785031/images/zqfvuxrxhip7shikyyj4.png",
  });

  group('get a product', () {
    test('should return a list of ProductModel', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        ),
      ).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_product_response.json'), 200));

      // Act
      final result = await productRemoteDataSourcesImpl.getallproduct();

      // Assert
      expect(result, isA<List<ProductModel>>());
    });

    test('should throw an error', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        ),
      ).thenAnswer((_) async => http.Response('not found', 404));

      // Act
      final result = productRemoteDataSourcesImpl.getallproduct;

      // Assert
      expect(() async => await result(), throwsA(isA<ServerException>()));
    });
  });
  const baseurl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  group('get product by id', () {
    test('should return a productmodel', () async {
      when(
        mockHttpClient.get(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        ),
      ).thenAnswer((_) async =>
          http.Response(readJson('helpers/dummy_data/byidjson.json'), 200));
      final result = await productRemoteDataSourcesImpl
          .getproductbyid('6672940692adcb386d593686');
      expect(result, equals(product));
    });
  });

  group('delete product by id', () {
    test('should delete the product with 200 sucess code', () async {
      when(mockHttpClient.delete(Uri.parse('$baseurl/${product.id}')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));

      final result = productRemoteDataSourcesImpl.deleteproduct;
      expect(() async => await result(product.id),
          throwsA(isA<ServerException>()));
    });

    test('should delete the product', () async {
      when(mockHttpClient.delete(Uri.parse('$baseurl/${product.id}')))
          .thenAnswer((_) async => http.Response('deleted', 200));

      await productRemoteDataSourcesImpl.deleteproduct(product.id);
      verify(mockHttpClient.delete(Uri.parse('$baseurl/${product.id}')));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
  group('update a product', () {
    test('should update a product on sucess call', () async {
      when(mockHttpClient.put(Uri.parse('$baseurl/${product.id}')))
          .thenAnswer((_) async => http.Response(readJson('helpers/dummy_data/updatejson.json'), 200));

      final result = await productRemoteDataSourcesImpl.updateproduct(
          id: product.id,
          name: product.name,
          description: product.description,
          price: product.price);
      expect(result, equals(product));
    });
  });
}
