import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mcbp/presentation/resources/string_resource.dart';
import 'package:mcbp/presentation/talika/registration_list.dart';

import '../../domain/model/district.dart';
import '../../domain/model/division.dart';
import '../../domain/model/registration.dart';
import '../../domain/model/upazilla.dart';
import '../../domain/model/village.dart';
import '../../utils/services/mcbp_db.dart';

class RegistrationEdit extends StatefulWidget {

  final Registration item;
  const RegistrationEdit({Key? key, required this.item}) : super(key: key);

  @override
  State<RegistrationEdit> createState() => _RegistrationEditState();
}

class _RegistrationEditState extends State<RegistrationEdit> {
  @override
  Widget build(BuildContext context) {

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

    var _nid = TextEditingController();
    _nid.text = widget.item.nationalId!;
    var _birthDate = TextEditingController();
    _birthDate.text = widget.item.birthDate!;
    final _nameInEBangla = TextEditingController();
    _nameInEBangla.text = widget.item.personalNameInBangla!;
    final _nameInEnglish = TextEditingController();
    _nameInEnglish.text = widget.item.personalNameInEnglish!;
    final _fatherName = TextEditingController();
    _fatherName.text = widget.item.personalFatherName!;
    final _motherName = TextEditingController();
    _motherName.text = widget.item.personalMotherName!;
    final _husbandName = TextEditingController();
    _husbandName.text = widget.item.personalHusbandName!;
    final _nickName = TextEditingController();
    _nickName.text = widget.item.personalNickName!;
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
    var db;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.item.personalNameInBangla!,style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WillPopScope(
          onWillPop: () async {
            await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> RegistrationList()),((Route<dynamic> route) => false));
            return true;
          },
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerRight,child: ElevatedButton(onPressed: (){}, child: const Text(StringResource.shongshodhon))
              ),
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        readOnly: true,
                        controller: _nid,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: "জাতীয় পরিচয় পত্র নং*",
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _birthDate,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.birthDate,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _birthDate,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.nameInBangla,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _nameInEnglish,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.nameInEnglish,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _fatherName,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.fatherName,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _motherName,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.motherName,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _husbandName,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.husbandName,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                        controller: _nickName,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: StringResource.nickName,
                        ),
                        onChanged: (value){
                            setState(() {
    
                            });
                        },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}