
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcbp/modules/dashboards/models/division.dart';
import 'package:mcbp/utils/helpers/string_resource.dart';

import '../models/district.dart';

class PersonalInfo extends StatefulWidget {


  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  List<District> list = [];
  List districtStringList=[];

  var items = StringResource.religeonList;
  var dropdownValue = StringResource.religeonList[0];

  var bloodGroup = StringResource.bloodGroup;
  var selectedBood = StringResource.bloodGroup[0];

  var matritialStatus = StringResource.maritialStatus;
  var selectedMaritialStatus = StringResource.maritialStatus[0];
  
  var districtDropdownValue = "";

  

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
    

    districtDropdownValue = list[0].nameInBangla;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return card();
  }
}
