import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secret extends StatefulWidget {
  const Secret({Key? key}) : super(key: key);

  @override
  State<Secret> createState() => _SecretState();
}

class _SecretState extends State<Secret> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SECRET SCREEN"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Material(
                elevation: 0,
                shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: MaterialButton(
                  onPressed: () async{
                    SharedPreferences preferences=await SharedPreferences.getInstance();
                    preferences.setBool("login", false);
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  color: Colors.blue[700],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
