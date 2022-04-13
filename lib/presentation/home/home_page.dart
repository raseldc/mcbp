import 'package:flutter/material.dart';
import 'package:mcbp/presentation/resources/colors.dart';
import 'package:mcbp/presentation/resources/fonts.dart';
import 'package:mcbp/presentation/resources/mcbp_routes.dart';
import 'package:mcbp/presentation/dashboard/dashboard_screen.dart';
import 'package:mcbp/presentation/registration/registration_screen.dart';
import 'package:mcbp/presentation/resources/string_resource.dart';
import 'package:mcbp/presentation/resources/style.dart';
import 'package:mcbp/presentation/resources/theme.dart';
import 'package:mcbp/presentation/resources/values.dart';
import 'package:mcbp/widgets/navigation_drawer.dart';
// import 'package:sizer/sizer.dart';
// import 'package:blurrycontainer/blurrycontainer.dart';


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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(StringResource.mohilaOdhidoptar,style: TextStyle(color: Colors.white),),
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
                            child: Center(child: Text(StringResource.motSokrioVatavogi,style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("১৬১,৮২৮",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
                            child: Center(child: Text("মোট পেমেন্ট",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("৮৫৫,৬২৪,০০০",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
                            child: Center(child: Text("এই বছর মোট পেমেন্ট",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("0",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
                            child: Center(child: Text("মোট আবেদন",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("১৭৬,৭৯৭",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
                            child: Center(child: Text(StringResource.dashboardSuparish,style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("১৭১,৯২৫",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
                            child: Center(child: Text("কমিটি কর্তৃক সুপারিশকৃত নয়",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
                          ),  VerticalDivider(thickness: 2,),
                          Container(
                            width: (MediaQuery.of(context).size.width/2)- (offsetData()),
                            child: Center(child: Text("৪,০৭৫",style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.darkGrey),)),
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
      ),
    );
  }
}
