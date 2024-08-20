import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/product/domain/usecases/addproduct.dart';
import '../../features/product/domain/usecases/deleteproduct.dart';
import '../../features/product/domain/usecases/getallproduct.dart';
import '../../features/product/domain/usecases/getproductbyid.dart';
import '../../features/product/domain/usecases/updateproduct.dart';
import '../../service_locator.dart';
import '../block/block_classes.dart';
import '../block/event_classes.dart';
import '../block/state_classes.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget textinputer(String name,
      {required TextEditingController controller,
      bool dollar = false,
      bool area = false,
      bool keyboard = false}) {
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
          'Add Product',
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
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is InitialState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        height: 150,
                        width: double.infinity,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                            },
                            child: _image != null
                                ? Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(_image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image,
                                            size: 50, color: Colors.grey[700]),
                                        const Text(
                                          "upload image",
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      textinputer("name", controller: nameController),
                      textinputer("category", controller: categoryController),
                      textinputer("price",
                          controller: priceController,
                          dollar: true,
                          keyboard: true),
                      textinputer("Description",
                          controller: descriptionController,
                          dollar: false,
                          area: true),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final name = nameController.text;
                          final category = categoryController.text;
                          final price = priceController.text;
                          final description = descriptionController.text;
                          final imgurl = _image != null ? _image!.path : "";
                          // print('malama ${descriptionController.text}');

                          BlocProvider.of<ProductBloc>(context).add(
                            CreateProductEvent(
                              name: name,
                              category: category,
                              price: price,
                              description: description,
                              imgurl: imgurl.toString(),
                            ),
                          );
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'ADD',
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
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          // productbloc.add(const CreateProductEvent(productData));
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
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CreatedProductState) {
              return const Text("Successs");
            } else {
              return const Text("Error");
            }
          }),
        ),
      ),
    );
  }
}
