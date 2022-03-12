import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/district.dart';
import '../models/division.dart';
import '../models/union.dart';
import '../models/upazilla.dart';
import '../models/village.dart';

class PermanentAddress extends StatefulWidget {

  @override
  State<PermanentAddress> createState() => _PermanentAddressState();
}

class _PermanentAddressState extends State<PermanentAddress> {

  List<Division> divisionList = [];
  List<District> districtList = [];
  List<Upazilla> upazillaList = [];
  List<Union> unionList = [];
  List<Village> villageList = [];

  List<District> queryDistrictList = [];
  List<Upazilla> queryUpazillaList = [];
  List<Union> queryUnionList = [];
  List<Village> queryVillageList = [];

  Division? selectedDivision;
  District? selectedDistrict;
  Upazilla? selectedUpazilla;
  Union? selectedUnion;
  Village? selectedVillage;


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

    //Loading Upazilla Data
    var upazillaJson = await rootBundle.loadString("assets/jsons/upazilla.json");
    
    var decodedUpazilla = jsonDecode(upazillaJson);


    var upazillaData = decodedUpazilla["upazilla"];
    upazillaList = List.from(upazillaData).
                                  map<Upazilla>((upazilla) =>  Upazilla.fromMap(upazilla)).
                                  toList();

    //Loading Union Data
    var unionJson = await rootBundle.loadString("assets/jsons/union.json");
    
    var decodedUnion = jsonDecode(unionJson);


    var unionData = decodedUnion["unions"];
    unionList = List.from(unionData).
                                  map<Union>((union) =>  Union.fromMap(union)).
                                  toList();


    //Loading Village Data
    var villageJson = await rootBundle.loadString("assets/jsons/village.json");
    
    var decodedVillage = jsonDecode(villageJson);


    var villageData = decodedVillage["village"];
    villageList = List.from(villageData).
                                  map<Village>((village) =>  Village.fromMap(village)).
                                  toList();
    

    selectedDivision = divisionList[0];
    

    setState(() {});
  }

  //Change District List According to Division
  changeDistrist(division){
    queryDistrictList = [];
    districtList.forEach((district) {
      if(district.divisionId == division.id){
          queryDistrictList.add(district);
        }
    });
    selectedDistrict = queryDistrictList[0];
  }

  //Change Upazilla List According to Division
  changeUpazilla(district){
    queryUpazillaList = [];
    upazillaList.forEach((upazilla) {
      if(upazilla.districtId == district.id){
          queryUpazillaList.add(upazilla);
        }
    });
    selectedUpazilla = queryUpazillaList[0];
  }

  //Change Union List According to Division
  changeUnion(upazilla){
    queryUnionList = [];
    unionList.forEach((union) {
      if(upazilla.id == union.upazillaId){
          queryUnionList.add(union);
        }
    });
    selectedUnion = queryUnionList[0];
  }

  //Change Village List According to Division
  changeVillage(union){
    queryVillageList = [];
    villageList.forEach((village) {
      if(union.id == village.unionId || village.upazilaId==union.upazillaId){
          queryVillageList.add(village);
        }
    });
    print(queryVillageList);
    selectedVillage = queryVillageList[0];
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
        title: Text("স্থায়ী ঠিকানা"),
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
              onChanged: (Division? newValue){ 

                setState(() {
                  changeDistrist(newValue);
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
              items: queryDistrictList.map((items) {
                
                return DropdownMenuItem(
                  value:  items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (District? newValue){ 
                setState(() {
                  changeUpazilla(newValue);
                  selectedDistrict = newValue!;
                });
              },
            ),
        )
          ),
          SizedBox(
            height: 20.0,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("উপজেলা"),
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
              value: selectedUpazilla,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: queryUpazillaList.map((items) {
                
                return DropdownMenuItem(
                  value:  items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (Upazilla? newValue){ 
                setState(() {
                  changeUnion(newValue);
                  selectedUpazilla = newValue!;
                });
              },
            ),
            )
          ),
          SizedBox(
            height: 20.0,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("ইউনিয়ন"),
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
              value: selectedUnion,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: queryUnionList.map((items) {
                
                return DropdownMenuItem(
                  value:  items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (Union? newValue){ 
                setState(() {
                  changeVillage(newValue);
                  selectedUnion = newValue!;
                });
              },
            ),
            )
          ),
          SizedBox(
            height: 20.0,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("গ্রাম"),
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
              value: selectedVillage,
              isExpanded: true,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: queryVillageList.map((items) {
                
                return DropdownMenuItem(
                  value:  items,
                  child:  Text(items.nameInBangla),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (Village? newValue){ 
                setState(() {
                  selectedVillage = newValue!;
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
              hintText: "পোস্ট কোড",
              labelText: "পোস্ট কোড",
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
              hintText: "রাস্তা/ব্লক/সেক্টর",
              labelText: "রাস্তা/ব্লক/সেক্টর",
            ),
            onChanged: (value){

            },
          )

        ],
      ),
    );
  }
}
