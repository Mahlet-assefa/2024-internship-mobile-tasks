import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_site/core/error/failure.dart';
import 'package:product_site/features/product/domain/entities/product.dart';
import 'package:product_site/features/product/domain/usecases/deleteproduct.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late Deleteproductusecase deleteproductusecase;
  late MockProductRepositories mockProductRepositories;

  setUp(() {
    mockProductRepositories = MockProductRepositories();
    deleteproductusecase = Deleteproductusecase(mockProductRepositories);
  });

  Product testProductDetail = const Product(
    id: '1',
    name: 'derby leather',
    category: 'men',
    description: 'lkudbwejbs',
    imgurl: '',
    price: '\$120',
  );

  test('sucessfuly deleted', () async {
    //arrange
    when(mockProductRepositories.deleteproduct(testProductDetail.id))
        .thenAnswer((_) async => Right(testProductDetail));
    //act
    final result = await deleteproductusecase.execute(testProductDetail.id);
    //assert
    expect(result, Right(testProductDetail));
  });
  ServerFailure failure = const ServerFailure('failing');
  test('failed tests', () async {
    when(mockProductRepositories.deleteproduct(testProductDetail.id))
        .thenAnswer((_) async => Left(failure));
    //act
    final result = await deleteproductusecase.execute(testProductDetail.id);
    //assert
    expect(result,  Left(failure));
  });
}
