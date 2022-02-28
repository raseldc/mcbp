import 'package:flutter/material.dart';
import 'package:mcbp/widgets/snackbar_alert.dart';

import '../../../config/routes/mcbp_routes.dart';
import '../../../utils/helpers/helper.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  double paddingVertical = 16.0;
  double paddingHorizontal = 32.0;
  double borderRadius = 20;

  final _username = TextEditingController();
  final _password = TextEditingController();

  registerBtn(){
    if(_username.text.isEmpty) {
      showToast(context, "User Id Required");
    }else if(_password.text.isEmpty){
      showToast(context, "Please Provide Password");
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      home : Material(
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
                      child : const Center(
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
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingVertical,horizontal: paddingHorizontal),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _username,
                        decoration: const InputDecoration(
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.lock),
                          hintText: "পাসওয়ার্ড",
                          labelText: "পাসওয়ার্ড",
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, AppRoutes.homeRoute);
                  },
                  child: const Text("লগ-ইন",style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed:  registerBtn,
                  child: const Text("Register",style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical : paddingVertical,horizontal : paddingHorizontal),
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child :  Container(
                          height: 100,
                          width: (MediaQuery.of(context).size.width),
                          decoration: const BoxDecoration(
                            color: Colors.white70,

                          ),
                          child : const Center(
                            child:  Text(
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
        ),
      )

    );
  }

}


