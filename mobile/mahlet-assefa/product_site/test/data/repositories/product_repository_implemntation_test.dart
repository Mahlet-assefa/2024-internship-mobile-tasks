// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:product_site/core/error/exception.dart';
// import 'package:product_site/core/error/failure.dart';
// import 'package:product_site/features/product/Data/models/product_model.dart';
// import 'package:product_site/features/product/Data/repositories/product_repository_impl.dart';
// import 'package:product_site/features/product/domain/entities/product.dart';

// import '../../helpers/test_helper.mocks.dart';

// void main() {
//   late MockProductRemoteDataSources mockProductRemoteDataSources;
//   late ProductRepositoryImpl productRepositoryImpl;
//   late MockNetworkInfo mockNetworkInfo;

//   setUp(() {
//     mockProductRemoteDataSources = MockProductRemoteDataSources();
//     mockNetworkInfo = MockNetworkInfo();
//     productRepositoryImpl = ProductRepositoryImpl(
//       productRemoteDataSources: mockProductRemoteDataSources,
//       networkInfo: mockNetworkInfo, localDataSources: null,
//     );
//   });

//   const testProductModel = ProductModel(
//     id: '1',
//     name: 'derby leather',
//     category: 'men',
//     description: 'lkudbwejbs',
//     imgurl: '',
//     price: '\$120',
//   );

//   const testProductEntity = ProductModel(
//     id: '1',
//     name: 'derby leather',
//     category: 'men',
//     description: 'lkudbwejbs',
//     imgurl: '',
//     price: '\$120',
//   );

//   group('get product', () {
//     test(
//       'should return product when a call to data source is successful',
//       () async {
//         // arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockProductRemoteDataSources.getallproduct())
//             .thenAnswer((_) async => [testProductModel]);

//         // act
//         final result = await productRepositoryImpl.getallproduct();

//         // assert
//         expect(result, isA<Right<Failure, List<Product>>>());
//       },
//     );

//     test(
//       'should return server failure when a call to data source is unsuccessful',
//       () async {
//         // arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockProductRemoteDataSources.getallproduct())
//             .thenThrow(ServerException('An error has occurred'));

//         // act
//         final result = await productRepositoryImpl.getallproduct();

//         // assert
//         expect(
//             result, equals(const Left(ServerFailure('An error has occurred'))));
//       },
//     );

//     test(
//       'should return connection failure when the device has no internet',
//       () async {
//         // arrange
//         when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//         when(mockProductRemoteDataSources.getallproduct()).thenThrow(
//             const SocketException('Failed to connect to the network'));

//         // act
//         final result = await productRepositoryImpl.getallproduct();

//         // assert
//         expect(
//             result,
//             equals(const Left(
//                 ConnectionFailure('Failed to connect to the network'))));
//       },
//     );
//   });

//   test(
//     'should return a product by id when a call to data source is successful',
//     () async {
//       // arrange
//       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//       when(mockProductRemoteDataSources.getproductbyid(testProductModel.id))
//           .thenAnswer((_) async => testProductModel);

//       // act
//       final result =
//           await productRepositoryImpl.getproductbyid(testProductModel.id);

//       // assert
//       expect(result, equals(const Right(testProductModel)));
//     },
//   );

//   test('should return a deleted product', () async {
//     when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
//     when(mockProductRemoteDataSources.deleteproduct(testProductModel.id))
//         .thenAnswer((_) async {});

//     final result =
//         await productRepositoryImpl.deleteproduct(testProductModel.id);

//     expect(result, equals(const Right(null)));
//   });
// }
