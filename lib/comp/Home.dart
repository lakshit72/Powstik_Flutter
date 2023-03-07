// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:powstick/comp/Cart.dart';
import 'package:powstick/comp/Login.dart';

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

List<Map> currProd = products;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navig(),
      backgroundColor: Colors.white,
      body: HomeBod(),
    );
  }

  AppBar Navig() {
    return AppBar(
      toolbarHeight: 212,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 44, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signOut()
                            .then((value) => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()))
                                })
                            .onError((error, stackTrace) => {});
                      },
                      icon: Icon(
                        Icons.logout,
                        size: 38,
                        color: Colors.black,
                      ))),
              Padding(
                  padding: EdgeInsets.fromLTRB(58, 44, 0, 0),
                  child: Image(
                    image: Image.network(
                            "https://powstik.com/wp-content/uploads/2022/12/powstik_logo-removebg-preview.png")
                        .image,
                    height: 80,
                    width: 180,
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(44, 44, 0, 0),
                  child: IconButton(
                      onPressed: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Cart()))
                          },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 40,
                        color: Colors.black,
                      )))
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 36),
              child: SizedBox(
                  width: 344,
                  child: TextField(
                      onChanged: (target) {
                        setState(() => currProd = products
                            .where((Map product) => product["title"]
                                .toLowerCase()
                                .contains(target.toLowerCase()))
                            .toList());
                      },
                      obscureText: false,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28.8,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 190, 72),
                                width: 2.4,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 22, 190, 72),
                                width: 2.0,
                              )),
                          labelText: "Search",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold)))))
        ],
      ),
      actions: const <Widget>[],
    );
  }
}

class HomeBod extends StatefulWidget {
  const HomeBod({super.key});

  @override
  State<HomeBod> createState() => HomeBodbuild();
}

class HomeBodbuild extends State<HomeBod> {
  final database = FirebaseDatabase.instance.ref();
  final User = FirebaseAuth.instance.currentUser?.email;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final Usercon = User?.substring(0, User?.indexOf("."));
    final refdata = database.child('/$Usercon');
    return SingleChildScrollView(
      child: Center(
          child: Wrap(
        children: currProd
            .map((e) => Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Image(
                        image: Image.asset(e['image']).image,
                        height: 180,
                        width: 180,
                      ),
                      Container(
                        width: 180,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(150, 0, 0, 0),
                                  blurRadius: 5,
                                  offset: Offset(-2, 5))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 3.5,
                                color: Color.fromARGB(255, 22, 198, 72))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                              child: Text(
                                e['title'].length < 45
                                    ? e['title']
                                    : '${e["title"].substring(0, 42)}...',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: Text(
                                'Rs.${e['price']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2, 0, 0, 0),
                                        child: Icon(Icons.arrow_upward),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(6, 0, 6, 0),
                                        child: Text(count.toString()),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2, 0, 0, 0),
                                        child: Icon(Icons.arrow_downward),
                                      )
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: FilledButton(
                                        onPressed: () {
                                          refdata.update({
                                            e["id"]: {
                                              "id": e['id'],
                                              "title": e['title'],
                                              "price": e['price'],
                                              "quantity": e['quantity'],
                                              "image": e['image']
                                            }
                                          });
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        255, 22, 198, 72))),
                                        child: Icon(Icons.shopping_cart),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      )),
    );
  }
}
