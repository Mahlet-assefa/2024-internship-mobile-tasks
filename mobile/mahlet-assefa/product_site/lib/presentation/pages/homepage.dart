import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_site/presentation/pages/Description.dart';

import '../../features/product/domain/entities/product.dart';
import '../../features/product/domain/usecases/addproduct.dart';
import '../../features/product/domain/usecases/deleteproduct.dart';
import '../../features/product/domain/usecases/getallproduct.dart';
import '../../features/product/domain/usecases/getproductbyid.dart';
import '../../features/product/domain/usecases/updateproduct.dart';
import '../../service_locator.dart';
import '../block/block_classes.dart';
import '../block/event_classes.dart';
import '../block/state_classes.dart';
import 'addpage.dart';

// ignore: camel_case_types
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget customcard({required Product product, required BuildContext context}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                     Description(product: product,),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  Container(
                    child: Image.network(product.imgurl, fit: BoxFit.fill),
                    width: double.infinity,
                    height: 200,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(product.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(product.price,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(product.category ?? "",
                            style: const TextStyle(color: Colors.grey)),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 225, 203, 5),
                            ),
                            Text("120", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final getallproductusecase = getIt<Getallproductusecase>();
    final getproductbyidusecase = getIt<Getproductbyidusecase>();
    final updateproductusecase = getIt<Updateproductusecase>();
    final deleteproductusecase = getIt<Deleteproductusecase>();
    final addproductusecase = getIt<Addproductusecase>();

    return BlocProvider(
      create: (context) => ProductBloc(
          getallproductusecase: getallproductusecase,
          getproductbyidusecase: getproductbyidusecase,
          updateproductusecase: updateproductusecase,
          deleteproductusecase: deleteproductusecase,
          addproductusecase: addproductusecase)
        ..add(const LoadAllProductEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[500],
                ),
                height: 40,
                width: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "july 14,2023",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "Yohannes",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      // ignore: prefer_const_constructors
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 9,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    "Available Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 19,
                      decoration: TextDecoration.none,
                      shadows: [],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 193, 191, 191),
                        width: 1.0, // Border width
                      ),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return const Searchpro();
                        //     },
                        //   ),
                        // );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                    // print("mahlet $state ");

                    if (state is LoadingState) {
                      return const Text("loading....");
                    }
                    if (state is LoadedAllProductState) {
                      // print("me");
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.products
                                .map((e) =>
                                    customcard(product: e, context: context))
                                .toList(),
                          ),
                          
                        ),
                      );
                    }
                    return const Text("succesfully Failed");
                  }),
                
                ),
              ),
            ),

            //column children ends here
          ],
        ),
          floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Addpage();
                          },
                        ),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 33, 54, 243),
                    // ignore: sort_child_properties_last
                    child: const Icon(Icons.add, color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
      ),
    );
  }
}
