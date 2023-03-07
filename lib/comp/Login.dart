// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, avoid_web_libraries_in_flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powstick/comp/Home.dart';
import 'package:powstick/comp/Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 190, 72),
      body: loginScreen(),
    );
  }
}

class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  TextEditingController Pass = TextEditingController();
  TextEditingController Email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          logoImg(),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 350,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(150, 0, 0, 0), blurRadius: 25.0),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 22, 190, 72)),
                ),
                SizedBox(
                  height: 35,
                ),
                loginForm(context),
                SizedBox(
                  height: 60,
                ),
                NaviSg(context)
              ],
            ),
          )
        ],
      ),
    ));
  }

  //components
  Widget logoImg() {
    return Image.network(
      "https://powstik.com/wp-content/uploads/2022/12/powstik_logo-removebg-preview.png",
      height: 100,
      width: 240,
    );
  }

  Widget loginForm(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: Email,
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
              controller: Pass,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
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
          height: 38,
        ),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: Email.text, password: Pass.text)
                  .then((value) => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()))
                      })
                  .onError((error, stackTrace) => {});
            },
            child: Text("LOGIN"))
      ],
    ));
  }

  Widget NaviSg(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an Account ? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Signup()));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 22, 190, 72),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
