import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcbp/modules/dashboards/models/division.dart';

import '../models/district.dart';

class PresentAddress extends StatefulWidget {

  @override
  State<PresentAddress> createState() => _PresentAddressState();
}

class _PresentAddressState extends State<PresentAddress> {
  List<Division> divisionList = [];
  List<District> districtList = [];
  List<District> queryDistrictList = [];
  Division? selectedDivision;
  District? selectedDistrict;
  String divId = "";


  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    
    //loading Division Data
    var divisionJson = await rootBundle.loadString("assets/jsons/division.json");
    
    var decodedDivision = jsonDecode(divisionJson);

    var divisionData = decodedDivision["division"];
    divisionList = List.from(divisionData).
                                  map<Division>((division) => Division.fromMap(division)).
                                  toList();

    //Loading District Data
    var districtJson = await rootBundle.loadString("assets/jsons/district.json");
    
    var decodedDistrict = jsonDecode(districtJson);


    var districtData = decodedDistrict["district"];
    districtList = List.from(districtData).
                                  map<District>((district) =>  District.fromMap(district)).
                                  toList();
    
    
    selectedDistrict = districtList[0];
    
    // list.forEach((value) {
    //   districtStringList.add(value.nameInBangla);
    // });

    // districtDropdownValue = districtStringList[0];
    // districtStringList = districtData;

    selectedDivision = divisionList[0];
    

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("বববর্তমান ঠিকানা"),
        childrenPadding: EdgeInsets.all(8.0),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("বিভাগ"),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey,width: 1)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
            child: DropdownButtonHideUnderline(child: DropdownButton(
              
              // Initial Value
              value: selectedDivision,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: divisionList.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (Division? newValue) async{ 

                
                setState(() {
                  selectedDivision = newValue!;
                });
              
              },
            ),
        )
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("জেলা"),
          ),
          
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey,width: 1)
            ),
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
            child: DropdownButtonHideUnderline(child: DropdownButton(
              
              // Initial Value
              value: selectedDistrict,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: districtList.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (District? newValue){ 
                setState(() {
                  selectedDistrict = newValue!;
                });
              },
            ),
        )
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),

        ],
      ),
    );
  }
}
