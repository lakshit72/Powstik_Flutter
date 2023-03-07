// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:powstick/comp/Home.dart';

List<Map> products = [];

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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
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
  final database = FirebaseDatabase.instance.ref();
  final User = FirebaseAuth.instance.currentUser?.email;
  @override
  void initState() {
    super.initState();
    activelist();
  }

  void activelist() {
    products = [];
    final Usercon = User?.substring(0, User?.indexOf("."));
    print(Usercon);
    database.child("/$Usercon").onValue.listen((event) {
      if (event.snapshot.value != null) {
        var data = event.snapshot.value;
        print(data);
        if (data.runtimeType == List<Object?>) {
          final parsedData = data as List;
          final filteredData = parsedData.where((elem) => elem != null);
          filteredData.toList().forEach((element) {
            products.add(element);
          });
        } else {
          data = data as Map;
          for (var element in data.values) {
            products.add(element);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(products);
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
