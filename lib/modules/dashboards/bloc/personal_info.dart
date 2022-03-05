
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
  var selectedMatitialStatus = StringResource.bloodGroup[0];
  
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
    
    // list.forEach((value) {
    //   districtStringList.add(value.nameInBangla);
    // });

    // districtDropdownValue = districtStringList[0];
    // districtStringList = districtData;

    districtDropdownValue = list[0].nameInBangla;

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
      child: (list.isNotEmpty)? ExpansionTile(
        initiallyExpanded: true,
        title: Text("ব্যক্তিগত তথ্য"),
        childrenPadding: EdgeInsets.all(8.0),
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "জাতীয় পরিচয় পত্র নং*",
              labelText: "জাতীয় পরিচয় পত্র নং*",
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
              hintText: "জন্ম তারিখ*",
              labelText: "জন্ম তারিখ*",
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
              hintText: "নাম (বাংলা)*",
              labelText: "নাম (বাংলা)",
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
              hintText: "নাম (ইংরেজি)*",
              labelText: "নাম (ইংরেজি)",
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
              hintText: "পিতার নাম*",
              labelText: "পিতার নাম",
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
              hintText: "মাতার নাম*",
              labelText: "মাতার নাম",
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
              hintText: "স্বামীর নাম*",
              labelText: "স্বামীর নাম",
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
              hintText: "যে নামে পরিচিত",
              labelText: "যে নামে পরিচিত",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
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
              value: districtDropdownValue,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: list.map((items) {
                return DropdownMenuItem(
                  value: items.nameInBangla,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  districtDropdownValue = newValue!;
                });
              },
            ),
        )
          ),
          SizedBox(
            height: 20.0,
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
              value: dropdownValue,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  dropdownValue = newValue!;
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
              hintText: "মোবাইল নং",
              labelText: "মোবাইল নং",
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
              hintText: "শিক্ষাগত যোগ্যতা",
              labelText: "শিক্ষাগত যোগ্যতা",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
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
                value: selectedBood,
                isExpanded: true,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),    
                  
                // Array list of items
                items: bloodGroup.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) { 
                  setState(() {
                    selectedBood = newValue!;
                  });
                },
              ),
          )
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey,width: 1)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              child: DropdownButtonHideUnderline(child: DropdownButton(
                hint: const Text(StringResource.maritialStatusHint),
                // Initial Value
                value: selectedMatitialStatus,
                isExpanded: true,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),    
                  
                // Array list of items
                items: matritialStatus.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) { 
                  setState(() {
                    selectedMatitialStatus= newValue!;
                  });
                },
              ),
          )
        ),

        ],
      ):const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
