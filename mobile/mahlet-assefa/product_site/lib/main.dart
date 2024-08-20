import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'features/product/Data/data_sources/remote_data_source.dart';
import 'features/product/domain/usecases/addproduct.dart';
import 'features/product/domain/usecases/deleteproduct.dart';
import 'features/product/domain/usecases/getallproduct.dart';
import 'features/product/domain/usecases/getproductbyid.dart';
import 'features/product/domain/usecases/updateproduct.dart';
import 'presentation/block/block_classes.dart';
import 'presentation/pages/addpage.dart';
import 'presentation/pages/homepage.dart';
import 'presentation/pages/updatepage.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid_single_cascade_in_expression_statements
  // ProductRemoteDataSourcesImpl(client: http.Client()).updateproduct(
  //         name: 'snaker back',
  //         description: 'we are the best',
  //         price: '56', id: '66bf15fd3b4ddf8b56f35362');
  // ProductRemoteDataSourcesImpl(client: http.Client())
  //     .deleteproduct("66bdb19d3a98d4876d1476bf");

  await setup();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     final getallproductusecase = getIt<Getallproductusecase>();
//     final getproductbyidusecase = getIt<Getproductbyidusecase>();
//     final updateproductusecase = getIt<Updateproductusecase>();
//     final deleteproductusecase = getIt<Deleteproductusecase>();
//     final addproductusecase = getIt<Addproductusecase>();

//     return BlocProvider(
//       create: (context) => ProductBloc(
//           getallproductusecase: getallproductusecase,
//           getproductbyidusecase: getproductbyidusecase,
//           updateproductusecase: updateproductusecase,
//           deleteproductusecase: deleteproductusecase,
//           addproductusecase: addproductusecase),
//       title: 'E-commerce App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const Homepage(),
//     );
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        getallproductusecase: getIt<Getallproductusecase>(),
        getproductbyidusecase: getIt<Getproductbyidusecase>(),
        updateproductusecase: getIt<Updateproductusecase>(),
        deleteproductusecase: getIt<Deleteproductusecase>(),
        addproductusecase: getIt<Addproductusecase>(),
      ),
      child: MaterialApp(
        home: const Homepage(),
      ),
    );
  }
}

