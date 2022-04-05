import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcbp/widgets/district_widget.dart';

import '../../../widgets/navigation_drawer.dart';
import '../../../domain/model/district.dart';
import '../../../presentation/home/home_page.dart';


class DistrictScreen extends StatefulWidget {
  const DistrictScreen({ Key? key }) : super(key: key);

  @override
  State<DistrictScreen> createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {

  List<District> list = [];
  List<String> districtStringList = [];

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    
    var districtJson = await rootBundle.loadString("assets/jsons/district.json");
    
    var decodedDistrict = jsonDecode(districtJson);


    var districtData = decodedDistrict["district"];
    list = List.from(districtData).
                                  map<District>((district) => District.fromMap(district)).
                                  toList();
    
    list.forEach((value) {
      districtStringList.add(value.nameInBangla);
    });

    setState(() {});
  }

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
            title: Text('Districts'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: (list.isNotEmpty)?
              ListView.builder(
                itemCount: list.length,
                itemBuilder: (context,index)=> 
                ItemWidget(item: list[index])
                ):const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ), 
    );
  }
}


