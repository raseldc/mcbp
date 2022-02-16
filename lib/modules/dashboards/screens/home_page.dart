import 'package:flutter/material.dart';
import 'package:mcbp/modules/dashboards/bloc/permanent_address.dart';
import 'package:mcbp/modules/dashboards/bloc/personal_info.dart';
import 'package:mcbp/modules/dashboards/bloc/present_address.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("মহিলা বিষয়ক অধিদপ্তর",style: TextStyle(color: Colors.white),)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                PersonalInfo(),
                PresentAddress(),
                PermanentAddress()
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
