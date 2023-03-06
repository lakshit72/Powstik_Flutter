// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import './comp/Home.dart';
import './comp/Login.dart';
import './comp/Signup.dart';
import './comp/Cart.dart';

Map<String, Color> Color_Map = {
  "primaryColor": Color.fromARGB(255, 255, 255, 255),
  "secondaryColor": Color.fromARGB(255, 20, 20, 20),
  "accentColor": Color.fromARGB(255, 22, 190, 72),
  "subtextColor": Color.fromARGB(255, 68, 68, 68),
  "errorColor": Color.fromARGB(255, 255, 0, 92)
};

//main function
void main() {
  runApp(Powstik());
}

//stateless class
class Powstik extends StatelessWidget {
  const Powstik({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 22, 190, 72),
                  shape: const StadiumBorder(),
                  maximumSize: const Size(250, 50),
                  minimumSize: const Size(250, 50))),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: Color.fromARGB(255, 22, 190, 72)),
              filled: true,
              fillColor: Color.fromARGB(40, 22, 190, 72),
              contentPadding: EdgeInsets.all(14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none))),
      home: Cart(),
    );
  }
}
