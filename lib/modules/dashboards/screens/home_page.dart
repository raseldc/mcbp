import 'package:flutter/material.dart';
import 'package:mcbp/config/routes/mcbp_routes.dart';
import 'package:mcbp/modules/dashboards/bloc/permanent_address.dart';
import 'package:mcbp/modules/dashboards/bloc/personal_info.dart';
import 'package:mcbp/modules/dashboards/bloc/present_address.dart';
import 'package:mcbp/modules/dashboards/screens/dashboard_screen.dart';
import 'package:mcbp/modules/dashboards/screens/registration_screen.dart';
import 'package:mcbp/utils/helpers/string_resource.dart';
import 'package:mcbp/widgets/navigation_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:blurrycontainer/blurrycontainer.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final h = 15;
  final double r = 10;
  final double p = 15;
  final double cardPadding = 8;

  offsetData(){
    return (p*2) + (cardPadding*2);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("মহিলা বিষয়ক অধিদপ্তর",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Container(
        width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(p),
        child: Center(
          child: Column(
            children: [
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text(StringResource.motSokrioVatavogi,style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,), 
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("১৬১,৮২৮",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            
              SizedBox(
                  height: 10.0,
                ),
                Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("মোট পেমেন্ট",style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,), 
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("৮৫৫,৬২৪,০০০",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
              ),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("এই বছর মোট পেমেন্ট",style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,),
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("0",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
              ),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("মোট আবেদন",style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,),
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("১৭৬,৭৯৭",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
              ),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("কমিটি কর্তৃক সুপারিশকৃত",style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,),
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("১৭১,৯২৫",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 10.0,
              ),
              Card(
                elevation: 5,
                borderOnForeground: false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/h,
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("কমিটি কর্তৃক সুপারিশকৃত নয়",style: TextStyle(fontWeight: FontWeight.w700),)),
                        ),  VerticalDivider(thickness: 2,),
                        Container(
                          width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                          child: Center(child: Text("৪,০৭৫",style: TextStyle(fontWeight: FontWeight.w400),)),
                        )
                      ],
                    ),
                  ),
                ),
              )
              ],
          ),
        ),
      ),
    )),
      drawer: NavigationDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.app_registration_rounded),label: "আবেদন",backgroundColor: Colors.blueGrey),
        BottomNavigationBarItem(icon: Icon(Icons.app_registration_rounded),label: "তালিকা",backgroundColor: Colors.blueGrey),
        
      ]),
    );
  }
}
