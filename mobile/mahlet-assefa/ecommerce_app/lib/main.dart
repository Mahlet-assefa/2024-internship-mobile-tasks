// import "package:ecommerce_app/home.dart";
// import "package:ecommerce_app/description.dart";
import "package:flutter/material.dart";
// import "package:ecommerce_app/form.dart";
import "package:ecommerce_app/home.dart";
// import "package:ecommerce_app/Description.dart";
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Productsample());
  }
}

void main() {
  
   runApp(const MyWidget());
  // runApp(const MyApp());
  // runApp(const Productsample());
}
