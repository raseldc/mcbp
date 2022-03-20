import 'package:flutter/material.dart';

class RegistrationFileUpload extends StatefulWidget {
  const RegistrationFileUpload({ Key? key }) : super(key: key);

  @override
  State<RegistrationFileUpload> createState() => _RegistrationFileUploadState();
}

class _RegistrationFileUploadState extends State<RegistrationFileUpload> {
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
        title: const Text("Upload Files"),
        childrenPadding: const EdgeInsets.all(8.0),
        children: [
          Row(
            children: [
              Text("Select File"),
              ElevatedButton(onPressed: (){
                
              }, child: Text("browse"))
            ],
          )
        ]
      )
    );
  }
}