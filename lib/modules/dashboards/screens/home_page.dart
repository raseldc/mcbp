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
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Drawer Header'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: ExpansionTile(
                  title: const Text('আবেদন',style: TextStyle(fontWeight: FontWeight.bold),),
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: (MediaQuery.of(context).size.width),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color : Colors.blueGrey
                        ),
                        child:Text('Union', style: TextStyle(
                          color: Colors.white,
                        ),)
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
