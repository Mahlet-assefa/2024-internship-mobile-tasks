import 'package:ecommerce_app/product_collect.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/Search.dart';
import "package:ecommerce_app/form.dart";
import "package:ecommerce_app/description.dart";
// import 'package:flutter/widgets.dart';

class Productsample extends StatelessWidget {
  const Productsample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Mobile App',
      home: Scaffold(body: Products()),
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  Widget customcard(
      {
        required Product product,
        required BuildContext context}) {
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
                  Image.asset(product.imageUrl),
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
                        child: Text(product.category,
                            style: const TextStyle(color: Colors.grey)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 225, 203, 5),
                            ),
                            Text(product.rating,
                                style: const TextStyle(color: Colors.grey)),
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
    return Scaffold(
      appBar: AppBar(
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Searchpro();
                          },
                        ),
                      );
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
              child: Column(
                children: [
                  customcard(
                    product:  Product(
                    category: "men's shoe",
                    imageUrl: 'assets/images/image.png',
                    price: "\$120",
                    name: "derby Leather Shoes",
                    rating: "(4.0)",
                    description: "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."),

                    context: context,
                  ),
                  customcard(
                    product:  Product(
                    category: "men's shoe",
                    imageUrl: 'assets/images/image.png',
                    price: "\$130",
                    name: "leakers Shoes",
                    rating: "(2.0)",
                    description: "Nike, a renowned global brand, offers a wide range of innovative and stylish footwear, one of which is the Nike Air Max 270. The Air Max 270 is known for its modern design and exceptional comfort. It features a sleek, breathable mesh upper that provides a snug fit while ensuring optimal airflow. The shoe's standout feature is its large Air Max unit in the heel, offering superior cushioning and impact absorption, making it ideal for all-day wear. Additionally, the foam midsole delivers responsive support, and the durable rubber outsole ensures excellent traction. "),

                    context: context,
                  ),
                  customcard(
                    product:  Product(
                    category: "women's shoe",
                    imageUrl: 'assets/images/image.png',
                    price: "\$140",
                    name: "sneakers Shoes",
                    rating: "(3.0)",
                    description: "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."),

                    context: context,
                  ),
                  customcard(
                    product:  Product(
                    category: "women shoe",
                    imageUrl: 'assets/images/image.png',
                    price: "\$150",
                    name: "nike Shoes",
                    rating: "(5.0)",
                    description: "Gucci, an iconic name in the luxury fashion industry, is synonymous with elegance, sophistication, and timeless style. Founded in Florence in 1921 by Guccio Gucci, the brand initially gained recognition for its high-quality leather goods, including luggage and equestrian accessories. Over the decades, Gucci has expanded its offerings to include ready-to-wear clothing, handbags, footwear, accessories, and fragrances, all characterized by exceptional craftsmanship and innovative design."),

                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const MyApp();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
