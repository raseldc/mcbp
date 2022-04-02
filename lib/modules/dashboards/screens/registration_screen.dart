import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcbp/utils/helpers/helper.dart';
import 'package:mcbp/widgets/navigation_drawer.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/helpers/string_resource.dart';
import '../../../utils/services/mcbp_db.dart';
import '../models/district.dart';
import '../models/division.dart';
import '../models/registration.dart';
import '../models/union.dart';
import '../models/upazilla.dart';
import '../models/village.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({ Key? key }) : super(key: key);

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {

  var db;
  String selectedConception = StringResource.conceptionTermList[0];

  List<District> list = [];
  List districtStringList=[];

  var items = StringResource.religeonList;
  var religion = StringResource.religeonList[0];

  var bloodGroup = StringResource.bloodGroup;
  var selectedBood = StringResource.bloodGroup[0];

  var matritialStatus = StringResource.maritialStatus;
  var selectedMaritialStatus = StringResource.maritialStatus[0];
  
  var personalDistrict = "";

  final _nid = TextEditingController();
  final _nameInBangla = TextEditingController();
  final _nameInEnglish = TextEditingController();
  final _fatherName = TextEditingController();
  final _motherName = TextEditingController();
  final _husbandName = TextEditingController();
  final _nickName = TextEditingController();
  final _mobileNumber = TextEditingController();
  final _education = TextEditingController();

  final _postCode = TextEditingController();
  final _street = TextEditingController();

  final _permanentPostCode = TextEditingController();
  final _permanentStreet = TextEditingController();

  File? tempImage;
  File? signatureImage;
  File? confirmationImage;
  String? tempImageBytes;
  String? signatureImageBytes;
  String? confirmationImageBytes;

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

  List<Division> permanentDivisionList = [];
  List<District> permanentDistrictList = [];
  List<Upazilla> permanentUpazillaList = [];
  List<Union> permanentUnionList = [];
  List<Village> permanentVillageList = [];

  List<District> querypermanentDistrictList = [];
  List<Upazilla> querypermanentUpazillaList = [];
  List<Union> querypermanentUnionList = [];
  List<Village> querypermanentVillageList = [];

  Division? permanentSelectedDivision;
  District? permanentSelectedDistrict;
  Upazilla? permanentSelectedUpazilla;
  Union? permanentSelectedUnion;
  Village? permanentSelectedVillage;


  //Social Financial State
  String selectedAsset = StringResource.assetAmountList[0];
  String selectedheadOccupation = StringResource.headOccupationList[0];
  String selectedHusbandMonthlyIncome = StringResource.husbandMonthlyIncomeList[0];
  String selectedSanitaionState = StringResource.yesOrNo[0];
  String selectedelectricityState = StringResource.yesOrNo[0];
  String selectedElectricFan = StringResource.yesOrNo[0];
  String selectedTubewel = StringResource.yesOrNo[0];
  String selectedInterior = StringResource.livingRoomStateList[0];
  String selectedDisablePerson = StringResource.disablePersonList[0];


  @override
  void initState(){
    super.initState();
    db = McbpDatabase.instance;
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
    permanentDivisionList = divisionList;

    //Loading District Data
    var districtJson = await rootBundle.loadString("assets/jsons/district.json");
    
    var decodedDistrict = jsonDecode(districtJson);


    var districtData = decodedDistrict["district"];
    districtList = List.from(districtData).
                                  map<District>((district) =>  District.fromMap(district)).
                                  toList();
    permanentDistrictList = districtList;
    list = districtList;

    //Loading Upazilla Data
    var upazillaJson = await rootBundle.loadString("assets/jsons/upazilla.json");
    
    var decodedUpazilla = jsonDecode(upazillaJson);


    var upazillaData = decodedUpazilla["upazilla"];
    upazillaList = List.from(upazillaData).
                                  map<Upazilla>((upazilla) =>  Upazilla.fromMap(upazilla)).
                                  toList();
    permanentUpazillaList = upazillaList;

    //Loading Union Data
    var unionJson = await rootBundle.loadString("assets/jsons/union.json");
    
    var decodedUnion = jsonDecode(unionJson);


    var unionData = decodedUnion["unions"];
    unionList = List.from(unionData).
                                  map<Union>((union) =>  Union.fromMap(union)).
                                  toList();
    permanentUnionList = unionList;


    //Loading Village Data
    var villageJson = await rootBundle.loadString("assets/jsons/village.json");
    
    var decodedVillage = jsonDecode(villageJson);


    var villageData = decodedVillage["village"];
    villageList = List.from(villageData).
                                  map<Village>((village) =>  Village.fromMap(village)).
                                  toList();
    permanentVillageList = villageList;
    

    selectedDivision = divisionList[0];
    permanentSelectedDivision = permanentDivisionList[0];
    

    personalDistrict = districtList[0].nameInBangla;

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

  //Change District List According to Division
  permanentChangeDistrist(division){
    querypermanentDistrictList = [];
    permanentDistrictList.forEach((district) {
      if(district.divisionId == division.id){
          querypermanentDistrictList.add(district);
        }
    });
    permanentSelectedDistrict = querypermanentDistrictList[0];
  }

  //Change Upazilla List According to Division
  permanentChangeUpazilla(district){
    querypermanentUpazillaList = [];
    permanentUpazillaList.forEach((upazilla) {
      if(upazilla.districtId == district.id){
          querypermanentUpazillaList.add(upazilla);
        }
    });
    permanentSelectedUpazilla = querypermanentUpazillaList[0];
  }

  //Change Union List According to Division
  permanentChangeUnion(upazilla){
    querypermanentUnionList = [];
    permanentUnionList.forEach((union) {
      if(upazilla.id == union.upazillaId){
          querypermanentUnionList.add(union);
        }
    });
    permanentSelectedUnion = querypermanentUnionList[0];
  }

  //Change Village List According to Division
  permanentChangeVillage(union){
    querypermanentVillageList = [];
    permanentVillageList.forEach((village) {
      if(union.id == village.unionId || village.upazilaId==union.upazillaId){
          querypermanentVillageList.add(village);
        }
    });
    permanentSelectedVillage = querypermanentVillageList[0];
  }

  // File Upload
  Future photoPicker() async{
    
    var status = await Permission.storage.status;
    if (status.isGranted) {
      try{
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          tempImage = File(image!.path);
        });
      }on PlatformException catch (e){
        print("Faild $e");
      }
    }else{
      Permission.storage.request();
    }

  }

  Future signaturePicker() async{
    
    var status = await Permission.storage.status;
    if (status.isGranted) {
      try{
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          signatureImage = File(image!.path);
        });
      }on PlatformException catch (e){
        print("Faild $e");
      }
    }else{
      Permission.storage.request();
    }

  }

  Future confirmPicker() async{
    
    var status = await Permission.storage.status;
    if (status.isGranted) {
      try{
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        confirmationImageBytes = base64Encode(File(image!.path).readAsBytesSync());
        setState(() {
          confirmationImage = File(image!.path);
          
        });
      }on PlatformException catch (e){
        print("Faild $e");
      }
    }else{
      Permission.storage.request();
    }

  }


  saveRegistration(context){
      if(_nid.text.isEmpty){
          showToast(context, "National Id Number is Required");
      }else if(_fatherName.text.isEmpty){
        showToast(context, "Father Name is Required");
      }else if(_nameInBangla.text.isEmpty){
        RegExp('[a-zA-Z]').hasMatch(_nameInBangla.text);
        showToast(context, "Bangla Name is Required");
      }else if(_motherName.text.isEmpty){
        showToast(context, "Mother Name is Required");
      }else if(_nickName.text.isEmpty){
        showToast(context, "Nick Name is Required");
      }else if(_mobileNumber.text.isEmpty){
        showToast(context, "Mobile Number is Required");
      }else if(_husbandName.text.isEmpty){
        showToast(context, "Husband Name is Required");
      }else if(_education.text.isEmpty){
        showToast(context, "Education is Required");
      }else if(religion.isEmpty){
        showToast(context, "Father Name is Required");
      }else if(selectedBood.isEmpty){
        showToast(context, "Blood Group is Required");
      }else if(personalDistrict.isEmpty){
        showToast(context, "District is Required");
      }else if(matritialStatus.isEmpty){
        showToast(context, "Maritial Status is Required");
      }else if(selectedDivision == null){
        showToast(context, "Present Division is Required");
      }else if(selectedDistrict == null){
        showToast(context, "Present District is Required");
      }else if(selectedUpazilla == null){
        showToast(context, "Present Sub District is Required");
      }else if(selectedUnion == null){
        showToast(context, "Present Union is Required");
      }else if(selectedVillage == null){
        showToast(context, "Present Village is Required");
      }else if(_postCode.text.isEmpty){
        showToast(context, "Present Post Code is Required");
      }else if(_street.text.isEmpty){
        showToast(context, "Present Street/Block is Required");
      }else if(permanentSelectedDivision == null){
        showToast(context, "Permanent Division is Required");
      }else if(permanentSelectedDistrict == null){
        showToast(context, "Permanent District is Required");
      }else if(permanentSelectedUpazilla == null){
        showToast(context, "Permanent Sub District is Required");
      }else if(permanentSelectedUnion == null){
        showToast(context, "Permanent Union is Required");
      }else if(permanentSelectedVillage == null){
        showToast(context, "Permanent Village is Required");
      }else if(_permanentPostCode.text.isEmpty){
        showToast(context, "Permanent Post Code is Required");
      }else if(_permanentStreet.text.isEmpty){
        showToast(context, "permanent Street/Block is Required");
      }else if(selectedAsset.isEmpty || selectedAsset ==  StringResource.assetAmountList[0]){
        showToast(context, "Asset Amount is Required");
      }else if(selectedheadOccupation.isEmpty || selectedheadOccupation == StringResource.headOccupationList[0]){
        showToast(context, "Head Occupation is Required");
      }else if(selectedHusbandMonthlyIncome.isEmpty || selectedHusbandMonthlyIncome == StringResource.husbandMonthlyIncomeList[0]){
        showToast(context, "Husband Monthly income is Required");
      }else if(selectedSanitaionState.isEmpty || selectedSanitaionState == StringResource.assetAmountList[0]){
        showToast(context, "Sanitation Facility is Required");
      }else if(selectedelectricityState.isEmpty || selectedelectricityState == StringResource.assetAmountList[0]){
        showToast(context, "electricity Facility is Required");
      }else if(selectedElectricFan.isEmpty || selectedElectricFan == StringResource.assetAmountList[0]){
        showToast(context, "Electric Fan Facility is Required");
      }else if(selectedTubewel.isEmpty || selectedTubewel == StringResource.assetAmountList[0]){
        showToast(context, "TubeWel is Required");
      }else if(selectedInterior.isEmpty || selectedInterior == StringResource.assetAmountList[0]){
        showToast(context, "Bed Room Wall is Required");
      }else if(selectedDisablePerson.isEmpty || selectedDisablePerson == StringResource.assetAmountList[0]){
        showToast(context, "Disable Person is Required");
      }else if(selectedConception.isEmpty || selectedConception == StringResource.assetAmountList[0]){
        showToast(context, "Conception priod is Required");
      }else{
        if(_nameInBangla.text.isNotEmpty){
          if(RegExp('[a-zA-Z]').hasMatch(_nameInBangla.text)){
            showToast(context, "Bangla Name Should Enter");
          }else{
            saveData(context);
          }
        
        }
        else if(_mobileNumber.text.isNotEmpty){
          if(!RegExp('^\+?(88)?0?1[3456789][0-9]{8}\b').hasMatch(_mobileNumber.text)){
            showToast(context, "Mobile Number Format is not Matched");
          }else{
            saveData(context);
          }
          
        }
        
      }

  }

  saveData(context) async{
      await db.createRegistration(
            Registration(
              nationalId: _nid.text,
              birthDate: "",
              personalNameInBangla: _nameInBangla.text,
              personalNameInEnglish: _nameInEnglish.text,
              personalFatherName: _fatherName.text,
              personalMotherName: _motherName.text,
              personalHusbandName: _husbandName.text,
              personalNickName: _nickName.text,
              personalBirthPlace: personalDistrict,
              personalReligeon : religion,
              personalMobileNo: _mobileNumber.text,
              personalEducation: _education.text,
              personalBloodGroup: selectedBood,
              personalMaritialStatus: selectedMaritialStatus,
              presentDivision: selectedDivision!.nameInBangla,
              presentDistrict: selectedDistrict!.nameInBangla,
              presentSubDistrict: selectedUpazilla!.nameInBangla,
              presentUnion: selectedUnion!.nameInBangla,
              presentVillage: selectedVillage!.nameInBangla,
              presentPostCode: _postCode.text,
              presentStreet: _street.text,
              permanentDivision: permanentSelectedDivision!.nameInBangla,
              permanentDistrict: permanentSelectedDistrict!.nameInBangla,
              permanentSubDistrict: permanentSelectedUpazilla!.nameInBangla,
              permanentUnion: permanentSelectedUnion!.nameInBangla,
              permanentVillage: permanentSelectedVillage!.nameInBangla,
              permanentPostCode: _permanentPostCode.text,
              permanentStreet: _permanentStreet.text,
              propertyAmount: selectedAsset,
              familyHeadOccupation: selectedheadOccupation,
              husbandMonthlyIncome: selectedHusbandMonthlyIncome,
              sanitationFacility: selectedSanitaionState,
              electricityFacility: selectedelectricityState,
              electricityFan: selectedElectricFan,
              tubewelFacility: selectedTubewel,
              bedRoomWall: selectedInterior,
              disablePerson: selectedDisablePerson,
              conceptionPriod: selectedConception,
              conceptionTimeInWeek: "", 
              accountName: '', accountNumber: '', paymentType: '', 
              attachment: basename(tempImage?.path??""),
              photo: basename(signatureImage?.path??""),
              signature: basename(confirmationImage?.path??""),
            )
          ).then((result){
              print("$result");
              register(context);
          }).catchError((error){
              print("$error");
              showToast(context, "$error");
              showToast(context, "User ID is Exists");
          });

  }

  register(context) async{
    var response = await http.post(
      Uri.parse('http://103.181.42.142:8001/imlma/api/applicantion/save'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nationalId': _nid.text,
        'birthDate': "",
        'personalNameInBangla': utf8.encode(_nameInBangla.text).toString(),
        'personalNameInEnglish': utf8.encode(_nameInEnglish.text).toString(),
        'personalFatherName': utf8.encode(_fatherName.text).toString(),
        'personalMotherName': utf8.encode(_motherName.text).toString(),
        'personalHusbandName': utf8.encode(_husbandName.text).toString(),
        'personalNickName': utf8.encode(_nickName.text).toString(),
        'personalBirthPlace': utf8.encode(personalDistrict).toString(),
        'personalReligeon' : utf8.encode(religion).toString(),
        'personalMobileNo': utf8.encode(_mobileNumber.text).toString(),
        'personalEducation': utf8.encode(_education.text).toString(),
        'personalBloodGroup': utf8.encode(selectedBood).toString(),
        'personalMaritialStatus': utf8.encode(selectedMaritialStatus).toString(),
        'presentDivision': utf8.encode(selectedDivision!.nameInBangla).toString(),
        'presentDistrict': utf8.encode(selectedDistrict!.nameInBangla).toString(),
        'presentSubDistrict': utf8.encode(selectedUpazilla!.nameInBangla).toString(),
        'presentUnion': utf8.encode(selectedUnion!.nameInBangla).toString(),
        'presentVillage': utf8.encode(selectedVillage!.nameInBangla).toString(),
        'presentPostCode': utf8.encode(_postCode.text).toString(),
        'presentStreet': utf8.encode(_street.text).toString(),
        'permanentDivision': utf8.encode(permanentSelectedDivision!.nameInBangla).toString(),
        'permanentDistrict': utf8.encode(permanentSelectedDistrict!.nameInBangla).toString(),
        'permanentSubDistrict': utf8.encode(permanentSelectedUpazilla!.nameInBangla).toString(),
        'permanentUnion': utf8.encode(permanentSelectedUnion!.nameInBangla).toString(),
        'permanentVillage': utf8.encode(permanentSelectedVillage!.nameInBangla).toString(),
        'permanentPostCode': utf8.encode(_permanentPostCode.text).toString(),
        'permanentStreet': utf8.encode(_permanentStreet.text).toString(),
        'propertyAmount': utf8.encode(selectedAsset).toString(),
        'familyHeadOccupation': utf8.encode(selectedheadOccupation).toString(),
        'husbandMonthlyIncome': utf8.encode(selectedHusbandMonthlyIncome).toString(),
        'sanitationFacility': utf8.encode(selectedSanitaionState).toString(),
        'electricityFacility': utf8.encode(selectedelectricityState).toString(),
        'electricityFan': utf8.encode(selectedElectricFan).toString(),
        'tubewelFacility': utf8.encode(selectedTubewel).toString(),
        'bedRoomWall': utf8.encode(selectedInterior).toString(),
        'disablePerson': utf8.encode(selectedDisablePerson).toString(),
        'conceptionPriod': utf8.encode(selectedConception).toString(),
        'conceptionTimeInWeek': "",
        'accountName': '', 'accountNumber': '', 'paymentType': '',
        'attachment': base64Encode(File(tempImage!.path).readAsBytesSync()),
        'photo': base64Encode(File(signatureImage!.path).readAsBytesSync()),
        'signature': base64Encode(File(confirmationImage!.path).readAsBytesSync()),
      }),
    );

    if (response.statusCode==200){
      print("$response");
      onBasicAlertPressed(context,"Registration Status", "$response");
    }else{
      print("$response");
      onBasicAlertPressed(context,"Registration Status", "$response");
    }
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
            title: Text('আবেদন'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
        body: (list.isNotEmpty)? SingleChildScrollView(
          
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Align(
                    alignment: Alignment.centerRight,child: ElevatedButton(onPressed: ()=>saveRegistration(context), child: Text("আবেদন"))),
                SizedBox(
                    height: 10.0,
                  ),//Personal Info Card
                  Card(
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
                          controller: _nid,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "জাতীয় পরিচয় পত্র নং*",
                            labelText: "জাতীয় পরিচয় পত্র নং*",
                          ),
                          onChanged: (value){
                              setState(() {
                                
                              });
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
                          controller: _nameInBangla,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "নাম (বাংলা)*",
                            labelText: "নাম (বাংলা)",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _nameInEnglish,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "নাম (ইংরেজি)*",
                            labelText: "নাম (ইংরেজি)",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _fatherName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "পিতার নাম*",
                            labelText: "পিতার নাম",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _motherName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "মাতার নাম*",
                            labelText: "মাতার নাম",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _husbandName,
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
                          controller: _nickName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "যে নামে পরিচিত",
                            labelText: "যে নামে পরিচিত",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
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
                            value: personalDistrict,
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
                                personalDistrict = newValue!;
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
                            value: religion,
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
                                religion = newValue!;
                              });
                            },
                          ),
                      )
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _mobileNumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "মোবাইল নং",
                            labelText: "মোবাইল নং",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _education,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "শিক্ষাগত যোগ্যতা",
                            labelText: "শিক্ষাগত যোগ্যতা",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
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
                              items: bloodGroup.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
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
                              // Initial Value
                              value: selectedMaritialStatus,
                              isExpanded: true,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),    
                                
                              // Array list of items
                              items: matritialStatus.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) { 
                                setState(() {
                                  selectedMaritialStatus = newValue!;
                                });
                              },
                            ),
                        )
                      ),

                      ],
                    ):const Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),//Present Address
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text("বর্তমান ঠিকানা"),
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
                          controller: _postCode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "পোস্ট কোড",
                            labelText: "পোস্ট কোড",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _street,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "রাস্তা/ব্লক/সেক্টর",
                            labelText: "রাস্তা/ব্লক/সেক্টর",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),//permanent Address,
                  Card(
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
                            value: permanentSelectedDivision,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: permanentDivisionList.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items.nameInBangla),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (Division? newValue){ 

                              setState(() {
                                permanentChangeDistrist(newValue);
                                permanentSelectedDivision = newValue!;
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
                            value: permanentSelectedDistrict,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: querypermanentDistrictList.map((items) {
                              
                              return DropdownMenuItem(
                                value:  items,
                                child:  Text(items.nameInBangla),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (District? newValue){ 
                              setState(() {
                                permanentChangeUpazilla(newValue);
                                permanentSelectedDistrict = newValue!;
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
                            value: permanentSelectedUpazilla,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: querypermanentUpazillaList.map((items) {
                              
                              return DropdownMenuItem(
                                value:  items,
                                child:  Text(items.nameInBangla),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (Upazilla? newValue){ 
                              setState(() {
                                permanentChangeUnion(newValue);
                                permanentSelectedUpazilla = newValue!;
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
                            value: permanentSelectedUnion,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: querypermanentUnionList.map((items) {
                              
                              return DropdownMenuItem(
                                value:  items,
                                child:  Text(items.nameInBangla),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (Union? newValue){ 
                              setState(() {
                                permanentChangeVillage(newValue);
                                permanentSelectedUnion = newValue!;
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
                            value: permanentSelectedVillage,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: querypermanentVillageList.map((items) {
                              
                              return DropdownMenuItem(
                                value:  items,
                                child:  Text(items.nameInBangla),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (Village? newValue){ 
                              setState(() {
                                permanentSelectedVillage = newValue!;
                              });
                            },
                          ),
                          )
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _permanentPostCode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "পোস্ট কোড",
                            labelText: "পোস্ট কোড",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _permanentStreet,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.person),
                            hintText: "রাস্তা/ব্লক/সেক্টর",
                            labelText: "রাস্তা/ব্লক/সেক্টর",
                          ),
                          onChanged: (value){
                            setState(() {
                              
                            });
                          },
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),//Social Financial
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text(StringResource.financialAndSocialState),
                      childrenPadding: const EdgeInsets.all(8.0),
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(StringResource.assetAmount),
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
                            value: selectedAsset,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.assetAmountList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedAsset = newValue!;
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
                          child: Text(StringResource.headOccupation),
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
                            value: selectedheadOccupation,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.headOccupationList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedheadOccupation = newValue!;
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
                          child: Text(StringResource.husbandMonthlyIncome),
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
                            value: selectedHusbandMonthlyIncome,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.husbandMonthlyIncomeList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedHusbandMonthlyIncome = newValue!;
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
                          child: Text(StringResource.sanitaryState),
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
                            value: selectedSanitaionState,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.yesOrNo.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedSanitaionState = newValue!;
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
                          child: Text(StringResource.electricityState),
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
                            value: selectedelectricityState,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.yesOrNo.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedelectricityState = newValue!;
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
                          child: Text(StringResource.electricFan),
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
                            value: selectedElectricFan,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.yesOrNo.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedElectricFan = newValue!;
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
                          child: Text(StringResource.tubewel),
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
                            value: selectedTubewel,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.yesOrNo.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedTubewel = newValue!;
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
                          child: Text(StringResource.livingRoomSate),
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
                            value: selectedInterior,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.livingRoomStateList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedInterior = newValue!;
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
                          child: Text(StringResource.disablePerson),
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
                            value: selectedDisablePerson,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.disablePersonList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedDisablePerson = newValue!;
                              });
                            
                            },
                          ),
                      )
                        ),
                      ]
                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),//Health 
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: const Text(StringResource.healthState),
                      childrenPadding: const EdgeInsets.all(8.0),
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(StringResource.conceptionTerm),
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
                            value: selectedConception,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),    
                              
                            // Array list of items
                            items: StringResource.conceptionTermList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child:  Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue){ 

                              setState(() {
                                selectedConception = newValue!;
                              });
                            
                            },
                          ),
                      )
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        
                      ]
                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),//File Upload
                  Column(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: const Text("ছবি/স্বাক্ষর"),
                          childrenPadding: const EdgeInsets.all(8.0),
                          children: [
                            Column(
                              children:[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("ছবি",style: TextStyle(fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Row(
                                    
                                    children: [
                                      tempImage != null?Image.file(tempImage!,width: MediaQuery.of(context).size.width/1.75,height: MediaQuery.of(context).size.height/6,fit: BoxFit.cover,) : Image.asset("assets/images/login_app_img.png",width: MediaQuery.of(context).size.width/3,height: MediaQuery.of(context).size.height/5,fit: BoxFit.cover),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: ElevatedButton(onPressed:()=> photoPicker(), child: Text("browse")),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("স্বাক্ষর/টিপসই",style: TextStyle(fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Row(
                                    
                                    children: [
                                      signatureImage != null?Image.file(signatureImage!,width: MediaQuery.of(context).size.width/1.75,height: MediaQuery.of(context).size.height/6,fit: BoxFit.cover,) : Image.asset("assets/images/login_app_img.png",width: MediaQuery.of(context).size.width/3,height: MediaQuery.of(context).size.height/5,fit: BoxFit.cover),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: ElevatedButton(onPressed:()=> signaturePicker(), child: Text("browse")),
                                      )
                                    ],
                                  ),
                                )
                              ]
                            )
                            
                          ]
                        )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: const Text("সংযু‌ক্তি"),
                          childrenPadding: const EdgeInsets.all(8.0),
                          children: [
                            Column(
                              children:[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("ছবি",style: TextStyle(fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Row(
                                    
                                    children: [
                                      confirmationImage != null?Image.file(confirmationImage!,width: MediaQuery.of(context).size.width/1.75,height: MediaQuery.of(context).size.height/6,fit: BoxFit.cover,) : Image.asset("assets/images/login_app_img.png",width: MediaQuery.of(context).size.width/3,height: MediaQuery.of(context).size.height/5,fit: BoxFit.cover),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18),
                                        child: ElevatedButton(onPressed:()=> confirmPicker(), child: Text("browse")),
                                      )
                                    ],
                                  ),
                                ),
                                
                              ]
                            )
                            
                          ]
                        )
                      )
                    ],
                  ),
                ]
              ),
            )
        ):const Center(
          child: CircularProgressIndicator(),
        ),
      ), 
    );
  }
}
