import 'package:flutter/material.dart';

import 'package:mcbp/domain/model/login.dart';
import 'package:mcbp/presentation/dashboard/dashboard_screen.dart';
import 'package:mcbp/presentation/home/home_page.dart';
import 'package:mcbp/presentation/login/login_viewmodel.dart';
import 'package:mcbp/presentation/resources/theme.dart';
import 'package:mcbp/presentation/resources/values.dart';
import 'package:mcbp/utils/services/mcbp_db.dart';
import 'package:mcbp/widgets/snackbar_alert.dart';

import '../resources/mcbp_routes.dart';
import '../../utils/helpers/helper.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginViewModel _viewModel = LoginViewModel();
  _bind(){
    _viewModel.start();
    _username.addListener(()=> _viewModel.setUserName(_username.text));
    _password.addListener(()=> _viewModel.setPassword(_password.text));
  }
  String name = "";
  double paddingVertical = 16.0;
  double paddingHorizontal = 32.0;
  double borderRadius = 20;

  final _username = TextEditingController();
  final _password = TextEditingController();

  var db;

  @override
  void initState(){
    _bind();
    super.initState();
    db = McbpDatabase.instance;
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  registerBtn() async{
    if(_username.text.isEmpty) {
      showToast(context, "User Id Required");
    }else if(_password.text.isEmpty){
      showToast(context, "Please Provide Password");
    }else{

      await db.create(
        Login(username: _username.text, password: _password.text)
      ).then((result){
          showToast(context, "Successfully User Created");
      }).catchError((error){
          showToast(context, "$error");
          showToast(context, "User ID is Exists");
      });
    }
  }

  loginBtn() async{
    if(_username.text.isEmpty) {
      showToast(context, "User Id Required");
    }else if(_password.text.isEmpty){
      showToast(context, "Please Provide Password");
    }else{
      await db.loginAuth(_username.text,_password.text).then((response){
        print("$response");
          showToast(context, "Login Successfully");
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> HomePage()),((Route<dynamic> route) => false));
      }).catchError((error){
          print(error);
          showToast(context, "$error");
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return _getContentWidget();
  }

  Widget _getContentWidget(){
    return MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        theme: getApplicationTheme(),
        home : Material(
            child:Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                    height: AppSize.s80,
                    width: AppSize.s80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Image(image: AssetImage('assets/images/logo.jpeg'))
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
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
                              StreamBuilder<bool>(
                                stream: _viewModel.outputIsUserNameIsValid,
                                builder: (context,snapShot){
                                  return TextFormField(
                                    controller: _username,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.person),
                                      hintText: "ব্যবহারকারী আইডি",
                                      labelText: "ব্যবহারকারী আইডি",
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              StreamBuilder<bool>(
                                stream: _viewModel.outputIsUserNameIsValid,
                                builder: (context,snapShot){
                                  return TextFormField(
                                    controller: _password,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.lock),
                                      hintText: "পাসওয়ার্ড",
                                      labelText: "পাসওয়ার্ড",
                                    ),
                                  );
                                }
                              )
                            ],
                          ),

                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        ElevatedButton(
                          onPressed: loginBtn,
                          child: const Text("লগ-ইন",style: TextStyle(color: Colors.white),),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        // ElevatedButton(
                        //   onPressed:  registerBtn,
                        //   child: const Text("Register",style: TextStyle(color: Colors.white),),
                        //   style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                        // ),
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
              ],
            )

        )

    );
  }

}


