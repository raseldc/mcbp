import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcbp/widgets/navigation_drawer.dart';

import '../bloc/financial_social_state.dart';
import '../bloc/permanent_address.dart';
import '../bloc/personal_info.dart';
import '../bloc/present_address.dart';
import 'home_page.dart';

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({ Key? key }) : super(key: key);

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> HomePage()),((Route<dynamic> route) => false));
        return true;
      },
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
            title: Text('আবেদন'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
        body: SingleChildScrollView(
          
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                  PersonalInfo(),
                  SizedBox(
                    height: 10.0,
                  ),
                  PresentAddress(),
                  SizedBox(
                    height: 10.0,
                  ),
                  PermanentAddress(),
                  SizedBox(
                    height: 10.0,
                  ),
                  FinancialSocialSate(),
                ]
              ),
            )
        ),
      ), 
    );
  }
}
