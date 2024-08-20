import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class Updatepage extends StatefulWidget {
  const Updatepage({super.key, required this.product});
  final Product product;
  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Widget textinputer(String name,
      {required TextEditingController controller,
      bool dollar = false,
      bool area = false,
      bool keyboard = false}) {
    print("this is the id place ${widget.product.id}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 10),
        area
            ? TextFormField(
                controller: controller,
                maxLines: 4,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 228, 222, 222),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            : TextField(
                keyboardType:
                    keyboard ? TextInputType.number : TextInputType.text,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 228, 222, 222),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  prefixText: dollar ? "\$" : "",
                  prefixStyle:
                      const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final getallproductusecase = getIt<Getallproductusecase>();
    final getproductbyidusecase = getIt<Getproductbyidusecase>();
    final updateproductusecase = getIt<Updateproductusecase>();
    final deleteproductusecase = getIt<Deleteproductusecase>();
    final addproductusecase = getIt<Addproductusecase>();
    final productbloc = ProductBloc(
        getallproductusecase: getallproductusecase,
        getproductbyidusecase: getproductbyidusecase,
        updateproductusecase: updateproductusecase,
        deleteproductusecase: deleteproductusecase,
        addproductusecase: addproductusecase);
    return BlocProvider(
        create: (context) => productbloc,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'update Product',
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Center(
            child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
              if (state is InitialState) {
                nameController.text = widget.product.name;
                descriptionController.text = widget.product.description;
                priceController.text = widget.product.price;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: textinputer("name", controller: nameController),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: textinputer("category",
                            controller: categoryController),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: textinputer("price",
                            controller: priceController,
                            dollar: true,
                            keyboard: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: textinputer("Description",
                            controller: descriptionController,
                            dollar: false,
                            area: true),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            final name = nameController.text;
                            final category = categoryController.text;
                            final price = priceController.text;
                            final description = descriptionController.text;

                            BlocProvider.of<ProductBloc>(context).add(
                              UpdateProductEvent(
                                name: name,
                                category: category,
                                price: price,
                                id: widget.product.id,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          // ignore: sort_child_properties_last
                          child: const Text(
                            'update',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 32, 44, 171),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: OutlinedButton(
                          onPressed: () {
                            // productbloc.add(const CreateProductEvent(productData));
                          },
                          // ignore: sort_child_properties_last
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Color.fromARGB(255, 175, 2, 2)),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(color: Colors.red),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is UpdateProductEvent) {
                return const Text("Successfully updated");
              } else {
                return const Text("Error");
              }
            }),
          ),
        ));
  }
}
