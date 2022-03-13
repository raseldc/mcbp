import 'package:flutter/material.dart';

import '../../../utils/helpers/string_resource.dart';

class HealthState extends StatefulWidget {
  const HealthState({ Key? key }) : super(key: key);

  @override
  State<HealthState> createState() => _HealthStateState();
}

class _HealthStateState extends State<HealthState> {

  String selectedConception = StringResource.conceptionTermList[0];

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
    );
  }
}