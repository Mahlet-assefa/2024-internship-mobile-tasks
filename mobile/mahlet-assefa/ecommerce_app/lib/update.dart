// import 'package:ecommerce_app/description.dart';
import 'dart:io';

import 'package:ecommerce_app/product_collect.dart';
import 'package:flutter/material.dart';

import "package:image_picker/image_picker.dart";

class Updated extends StatefulWidget {
  final Product product;
  const Updated({super.key, required this.product});

  @override
  State<Updated> createState() => _UpdatedState();
}

class _UpdatedState extends State<Updated> {
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

  Widget textinputer(String name, String texter,
      {bool dollar = false, bool area = false}) {
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
        TextFormField(
          controller: TextEditingController(text: texter),
          maxLines: area ? 4 : 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 228, 222, 222),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixText: dollar ? "\$" : "",
            prefixStyle: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          keyboardType: dollar ? TextInputType.number : TextInputType.name,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                textinputer("name", widget.product.name),
                textinputer("category", widget.product.category),
                textinputer("price", widget.product.price, dollar: true),
                textinputer("Description", widget.product.description,
                    dollar: false, area: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
                    backgroundColor: const Color.fromARGB(255, 32, 44, 171),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Color.fromARGB(255, 175, 2, 2)),
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
        ));
  }
}
