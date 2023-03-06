// ignore_for_file: file_names

import 'package:flutter/material.dart';

final List<Map> products = [
  {
    "id": "1",
    "title": "Sudo Keema Samosa (250gm/Pack)",
    "price": "330.00",
    "quantity": "1",
    "image": "assets/p1.jpg"
  },
  {
    "id": "2",
    "title": "Sudo Plant Based Burger Patty (300gm)",
    "price": "330.00",
    "quantity": "1",
    "image": "assets/p2.jpg"
  },
  {
    "id": "3",
    "title":
        "Mindful Healthy Trail Mix with Fig & Raisin Dry Fruit, Tropical Fruits & Nuts, 200g",
    "price": "315.00",
    "quantity": "1",
    "image": "assets/p3.jpg"
  },
  {
    "id": "4",
    "title":
        "Mindful Healthy Trail Mix with Papaya & Pineapple Dry Fruit, Tropical Fruits & Nuts, 200g",
    "price": "315.00",
    "quantity": "1",
    "image": "assets/p4.jpg"
  },
  {
    "id": "5",
    "title": "Mindful Cashewm Oregano 300gm",
    "price": "550.00",
    "quantity": "1",
    "image": "assets/p5.jpg"
  },
  {
    "id": "6",
    "title": "5kg Low GI Combo",
    "price": "1099.00",
    "image": "assets/p6.jpg"
  },
  {
    "id": "7",
    "title": "Sudo Chicken Popcorn",
    "price": "330.00",
    "quantity": "1",
    "image": "assets/p7.jpg"
  },
  {
    "id": "8",
    "title": "Sudo mVegetarian Galouti Kebab (250gm)",
    "price": "330.00",
    "quantity": "1",
    "image": "assets/p8.jpg"
  },
  {
    "id": "9",
    "title": "Sudo-Plant Based Chicken Miracle Momos (230gm)",
    "price": "330.00",
    "quantity": "1",
    "image": "assets/p9.jpg"
  },
  {
    "id": "10",
    "title": "Sudo-Vegan Burger Patty and Popcorn (250gm/Pack)",
    "price": "630.00",
    "quantity": "1",
    "image": "assets/p10.jpg"
  },
];

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => CartPage();
}

class CartPage extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 198, 72),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cancel_outlined,
              size: 35,
            ),
          ),
        ),
        title: const Text(
          "Your Cart",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: CartBod(),
      persistentFooterButtons: [
        Center(
          child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 22, 198, 72)),
                  fixedSize: MaterialStatePropertyAll(Size(340, 45))),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 22, color: Colors.white),
              )),
        )
      ],
    );
  }
}

class CartBod extends StatefulWidget {
  const CartBod({super.key});

  @override
  State<CartBod> createState() => CartBodc();
}

class CartBodc extends State<CartBod> {
  @override
  Widget build(BuildContext context) {
    List<Map> curr = products;
    return ListView(
        children: curr
            .map((e) => Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        e['image'],
                        height: 120,
                        width: 120,
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['title'],
                                softWrap: true,
                                style: TextStyle(),
                              ),
                              Text('Price Rs.${e['price']}')
                            ]),
                      ),
                    ),
                    FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 255, 10, 10))),
                        child: Icon(Icons.highlight_remove_sharp))
                  ],
                ))
            .toList());
  }
}
