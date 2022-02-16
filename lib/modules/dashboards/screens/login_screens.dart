import 'package:flutter/material.dart';

import '../../../config/routes/mcbp_routes.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  double paddingVertical = 16.0;
  double paddingHorizontal = 32.0;
  double borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical,horizontal: paddingHorizontal),
                child: Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: Colors.grey,
                    ),
                    child : Center(
                      child: Text(
                        "লগ-ইন",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 24,
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: paddingVertical,horizontal: paddingHorizontal),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person),
                        hintText: "্যবহারকারী আইডি",
                        labelText: "ব্যবহারকারী আইডি",
                      ),
                      onChanged: (value){
                        name = value;
                        setState(() {

                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.lock),
                        hintText: "পাসওয়ার্ড",
                        labelText: "পাসওয়ার্ড",
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
                child: Text("লগ-ইন",style: TextStyle(color: Colors.white),),
                style: TextButton.styleFrom(backgroundColor: Colors.indigo),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical : paddingVertical,horizontal : paddingHorizontal),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child :  Container(
                        height: 100,
                        width: (MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                          color: Colors.white70,

                        ),
                        child : Center(
                          child: Text(
                            "© ২০১৮-২০১৯ উন্নত মাতৃত্বকাল এবং ল্যাকটেটিং মাদার ভাতা প্রকল্প, মহিলা বিষয়ক অধিদপ্তর, মহিলা ও শিশু বিষয়ক মন্ত্রণালয়, সহায়তায় WFP।",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        )
                    )
                ),
              )

            ],
          ),
        ),
      )

    );
  }
}
