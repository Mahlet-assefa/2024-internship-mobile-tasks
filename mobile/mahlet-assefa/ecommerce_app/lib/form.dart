import 'package:flutter/material.dart';
// import "package:image_picker/image_picker.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Addproduct();
  }
}

class Addproduct extends StatelessWidget {
  const Addproduct({super.key});
  // final ImagePicker _picker = ImagePicker();


  Widget textinputer(String name, {bool dollar = false, bool area = false}) {
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
                keyboardType: TextInputType.name,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 50, color: Colors.grey[700]),
                      const Text(
                        "upload image",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              textinputer("name"),
              textinputer("category"),
              textinputer("price", dollar: true),
              textinputer("Description", dollar: false, area: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
      ),
    );
  }
}
