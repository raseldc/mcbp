import 'package:flutter/material.dart';

import '../../../config/routes/mcbp_routes.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_app_img.png",fit: BoxFit.cover,),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome To Login "+name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (value){
                      name = value;
                      setState(() {

                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              },
              child: Text("Login"),
              style: TextButton.styleFrom(),
            ),

          ],
        ),
      )

    );
  }
}
