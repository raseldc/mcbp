import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistrationFileUpload extends StatefulWidget {
  const RegistrationFileUpload({ Key? key }) : super(key: key);

  @override
  State<RegistrationFileUpload> createState() => _RegistrationFileUploadState();
}

class _RegistrationFileUploadState extends State<RegistrationFileUpload> {
  File? tempImage;
  File? signatureImage;
  File? confirmationImage;
  

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}