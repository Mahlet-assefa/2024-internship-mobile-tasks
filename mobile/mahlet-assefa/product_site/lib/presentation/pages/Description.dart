// import 'package:ecommerce_app/product_collect.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_site/presentation/block/block_classes.dart';
import 'package:product_site/presentation/pages/updatepage.dart';

import '../../features/product/domain/entities/product.dart';
import '../../features/product/domain/usecases/addproduct.dart';
import '../../features/product/domain/usecases/deleteproduct.dart';
import '../../features/product/domain/usecases/getallproduct.dart';
import '../../features/product/domain/usecases/getproductbyid.dart';
import '../../features/product/domain/usecases/updateproduct.dart';
import '../../service_locator.dart';
import '../block/event_classes.dart';
import '../block/state_classes.dart';
import 'homepage.dart';

class Description extends StatefulWidget {
  const Description({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Image.network(widget.product.imgurl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 249, 254),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: const Color.fromARGB(255, 10, 14, 231),
                  ),
                ),
              ),
            ]),
            const Row(children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Text(
              //     widget.product.category,
              //     style: const TextStyle(fontWeight: FontWeight.w300),
              //   ),
              // ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      "4.0",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    widget.product.price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Size:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSizeIndex = index;
                      });
                    },
                    child: Container(
                      width: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: selectedSizeIndex == index
                            ? const Color.fromARGB(255, 32, 44, 171)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedSizeIndex == index
                              ? const Color.fromARGB(255, 32, 44, 171)
                              : const Color.fromARGB(255, 237, 235, 235),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${39 + index}",
                          style: TextStyle(
                            color: selectedSizeIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.product.description,
                )),
            BlocListener<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is DeletedProductState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('product deleted sucessfully')));
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Homepage()),
                      (route) => false,
                    );
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('product failed to delete')));
                  }
                },
                child: Row(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton(
                        onPressed: () {
                          context
                              .read<ProductBloc>()
                              .add(DeleteProductEvent(widget.product.id));
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Delete',
                          style:
                              TextStyle(color: Color.fromARGB(255, 175, 2, 2)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: Colors.red),
                          minimumSize: const Size(140, 50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Updatepage(product: widget.product);
                              },
                            ),
                          );
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 32, 44, 171),
                          minimumSize: const Size(140, 50),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
