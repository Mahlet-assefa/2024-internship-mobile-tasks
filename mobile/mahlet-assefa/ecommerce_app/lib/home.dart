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
      {img, proname, price, desc, rating, required BuildContext context}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const Description(), // Replace with your actual page
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  Image.asset(img),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(proname,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(price,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(desc,
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
                            Text(rating,
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
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "derby Leather Shoes",
                    rating: "(4.0)",
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
