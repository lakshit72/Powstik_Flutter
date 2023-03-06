// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignPage();
}

class SignPage extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 190, 72),
      body: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignClass();
}

class SignClass extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            logoImg(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(150, 0, 0, 0), blurRadius: 25.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "SIGNUP",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 22, 190, 72)),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  signForm(),
                  SizedBox(
                    height: 60,
                  ),
                  Alsign()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget logoImg() {
    return Image.network(
      "https://powstik.com/wp-content/uploads/2022/12/powstik_logo-removebg-preview.png",
      height: 100,
      width: 240,
    );
  }

  Widget signForm() {
    return Form(
        child: Column(
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Full Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 22, 190, 72),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        SizedBox(
          width: 250,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "UserName",
              prefixIcon: Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 22, 190, 72),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        SizedBox(
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "PassWord",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 22, 190, 72),
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 18,
        ),
        SizedBox(
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Retype PassWord",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 22, 190, 72),
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 38,
        ),
        ElevatedButton(onPressed: () {}, child: Text("LOGIN"))
      ],
    ));
  }

  Widget Alsign() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an Account ? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Log In",
            style: TextStyle(
                color: Color.fromARGB(255, 22, 190, 72),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
