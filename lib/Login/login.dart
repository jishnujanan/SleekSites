import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Secret/secret.dart';
import '../textstyle.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String result="";
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding:const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Email', style: styleformfield),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'email is required';
                                  else
                                    return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                obscureText: false,
                                decoration: const InputDecoration(
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Password', style: styleformfield),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'password is required';
                                  else
                                    return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22))),
                                child: MaterialButton(
                                  onPressed: () async {
                                    if(formkey.currentState!.validate())
                                      {
                                        if (email == "abc@gmail.com" &&
                                            password == "1234") {
                                          SharedPreferences shared =
                                          await SharedPreferences.getInstance();
                                          shared.setBool("login", true);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Secret(),
                                              ));
                                        }
                                        else
                                        {
                                          result="Inavlid Credentials";
                                        }
                                      }
                                  },
                                  color: Colors.blue[700],
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(22))),
                                child: Text(
                                  result,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                      color: Colors.red, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
