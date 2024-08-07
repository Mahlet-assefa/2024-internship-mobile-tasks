import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product_site/core/error/failure.dart';
import 'package:product_site/features/product/domain/entities/product.dart';
import 'package:product_site/features/product/domain/usecases/getallproduct.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late Getallproductusecase getallproductusecase;
  late MockProductRepositories mockProductRepositories;

  setUp(() {
    mockProductRepositories = MockProductRepositories();
    getallproductusecase = Getallproductusecase(mockProductRepositories);
  });

  const testProductDetail = [
    Product(
      id: '2',
      name: 'derby leather',
      category: 'men',
      description: 'lkudbwejbs',
      imgurl: '',
      price: '\$120',
    ),
    Product(
      id: '3',
      name: 'abebe leather',
      category: 'men',
      description: 'nynfsudmesik',
      imgurl: '',
      price: '\$130',
    )
  ];

  test('we should get all the products from the repository', () async {
    //arrange
    when(mockProductRepositories.getallproduct())
        .thenAnswer((_) async => const Right(testProductDetail));
    //act
    final result = await getallproductusecase.execute();
    //assert
    expect(result, const Right(testProductDetail));
  });
  ServerFailure failure = const ServerFailure('failing');
  test('Error will happen following this test', () async {
    //arrange
    when(mockProductRepositories.getallproduct())
        .thenAnswer((_) async => Left(failure));
    //act
    final result = await getallproductusecase.execute();
    //assert
    expect(result, Left(failure));
  });
}
