import 'package:flutter/material.dart';
import 'package:mcbp/domain/model/registration.dart';
import 'package:mcbp/presentation/resources/colors.dart';
import 'package:mcbp/presentation/resources/fonts.dart';
import 'package:mcbp/presentation/resources/values.dart';

import '../presentation/resources/mcbp_routes.dart';
import '../presentation/talika/registration_edit.dart';

class ItemWidget extends StatelessWidget {
  final Registration item;

  const ItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.personalNameInBangla} pressed");
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationEdit(item: item,),
          ),
        );
        },
        leading: Icon(Icons.person),
        title: Text(item.personalNameInBangla!),
        subtitle: Text(item.personalNameInEnglish!),
        trailing: Text(
          "NID - ${item.nationalId!}",
          textScaleFactor: 1,
          style: TextStyle(
            color: ColorManager.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}