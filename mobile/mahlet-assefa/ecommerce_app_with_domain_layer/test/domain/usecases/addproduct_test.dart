// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_site/core/error/failure.dart';
import 'package:product_site/features/product/domain/entities/product.dart';
// import 'package:product_site/features/product/domain/entities/product.dart';
import 'package:product_site/features/product/domain/usecases/addproduct.dart';
// import 'package:product_site/features/product/domain/usecases/addproduct.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late Addproductusecase addproductusecase;
  late MockProductRepositories mockProductRepositories;

  setUp(() {
    mockProductRepositories = MockProductRepositories();
    addproductusecase = Addproductusecase(mockProductRepositories);
  });

  Product testProductDetail = 
    const Product(
      id: '1',
      name: 'derby leather',
      category: 'men',
      description: 'lkudbwejbs',
      imgurl: '',
      price: '\$120',
    );
  test('added a product to the repository', () async {
    //arrange
    when(mockProductRepositories.addproduct(testProductDetail))
        .thenAnswer((_) async => const Right(null));
    //act
    final result = await addproductusecase.call(testProductDetail);
    //assert
    expect(result, const Right(null));
  });

  ServerFailure failure = const ServerFailure('failing');
  test('failed to add products', () async {
    //arrange
    when(mockProductRepositories.addproduct(testProductDetail))
        .thenAnswer((_) async => Left(failure));
    //act
    final result = await addproductusecase.call(testProductDetail);
    //assert
    expect(result, Left(failure));
  });
}
