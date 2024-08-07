import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_site/core/error/failure.dart';
import 'package:product_site/features/product/domain/entities/product.dart';
import 'package:product_site/features/product/domain/usecases/updateproduct.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late Updateproductuecase updateproductuecase;
  late MockProductRepositories mockProductRepositories;
  setUp(() {
    mockProductRepositories = MockProductRepositories();
    updateproductuecase = Updateproductuecase(mockProductRepositories);
  });

  Product testProductDetail = const Product(
    id: '1',
    name: 'derby leather',
    category: 'men',
    description: 'lkudbwejbs',
    imgurl: '',
    price: '\$120',
  );

  test('updated the products', () async {
    //arrange
    when(mockProductRepositories.updateproduct(testProductDetail.id))
        .thenAnswer((_) async => Right(testProductDetail));
    //act
    final result = await updateproductuecase.execute(testProductDetail.id);
    //assert
    expect(result, Right(testProductDetail));
  });
  ServerFailure failure = const ServerFailure('failing');
  test('failed updating the products', () async {
    //arrange
    when(mockProductRepositories.updateproduct(testProductDetail.id))
        .thenAnswer((_) async => Left(failure));
    //act
    final result = await updateproductuecase.execute(testProductDetail.id);
    //assert
    expect(result, Left(failure));
  });
}
