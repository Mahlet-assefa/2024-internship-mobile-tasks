import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:product_site/features/product/Data/models/product_model.dart';
// import 'package:product_site/features/product/domain/entities/product.dart';
void main() {
  final pJson = {
      'id': '1',
      'name': 'derby leather',
      'category': 'men',
      'description': 'lkudbwejbs',
      'imgurl': '',
      'price': '\$120',
  };
  const testProductmodel = ProductModel(
    id: '1',
    name: 'derby leather',
    category: 'men',
    description: 'lkudbwejbs',
    imgurl: '',
    price: '\$120',
  );

  test(
    'should be a subclass of product entity',
    () async {
      // assert
      expect(testProductmodel, isA<ProductModel>());
    },
  );

  test(
    'should correctly convert from JSON to productmodel',
    () async {
      final Map<String, dynamic> jsonMap = pJson;
      final result = ProductModel.fromJson(jsonMap);
      expect(result, testProductmodel);
    },
  );
  final product = ProductModel.fromJson(json as Map<String, dynamic>);
  test(
    'should correctly convert to JSON from ProductModel',
    () async {
      final result = product.toJson();
      expect(result, testProductmodel);
    },
  );
}