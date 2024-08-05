import 'package:flutter/material.dart';
import "package:ecommerce_app/description.dart";

class Searchpro extends StatefulWidget {
  const Searchpro({super.key});

  @override
  State<Searchpro> createState() => _SearchproState();
}

class _SearchproState extends State<Searchpro> {
  bool _isFilterVisible = false;
  RangeValues _currentRangeValues = const RangeValues(20, 60);
  
  get product => null;

  Widget customcard(
      {img, proname, price, desc, rating, required BuildContext context}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  Description(
                  product: product,
                ),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.asset(img),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(proname),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(price),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(desc),
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
                          Text(rating),
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
    );
  }

  Widget textinputer(String name,
      {bool dollar = false, bool fill = true, bool area = false}) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          textAlign: TextAlign.left,
        ),
      ),
      Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: fill,
              fillColor: const Color.fromARGB(255, 228, 222, 222),
              border: OutlineInputBorder(
                borderSide: fill
                    ? BorderSide.none
                    : const BorderSide(color: Colors.black12),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          Positioned(
            top: 20,
            left: 440,
            child: Text(
              dollar ? "\$" : '',
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Product',
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 330,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Leather',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 20,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color.fromARGB(255, 52, 71, 241),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFilterVisible = !_isFilterVisible;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 29, 47, 245),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.filter_list_rounded,
                      color: Color.fromARGB(255, 226, 223, 223),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "Derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "Derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                  customcard(
                    desc: "men's shoe",
                    img: 'assets/images/image.png',
                    price: "\$120",
                    proname: "Derby Leather Shoes",
                    rating: "(4.0)",
                    context: context,
                  ),
                ],
              ),
            ),
          ),
          
          if (_isFilterVisible)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: textinputer("Category", fill: false),
                    ),
                    const Text("Price"),
                    RangeSlider(
                      activeColor: const Color(0xFF3F51F3),
                      inactiveColor: const Color(0xFFD9D9D9),
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isFilterVisible = false;
                          });
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromARGB(255, 32, 44, 171),
                          minimumSize: const Size(340, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
