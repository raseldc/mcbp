import 'package:flutter/material.dart';
import 'package:mcbp/modules/dashboards/models/district.dart';

class ItemWidget extends StatelessWidget {
  final District item;

  const ItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.nameInBangla} pressed");
        },
        leading: Text(item.id),
        title: Text(item.nameInBangla),
        subtitle: Text(item.nameInEnglish),
        trailing: Text(
          "\$${item.divisionId}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}