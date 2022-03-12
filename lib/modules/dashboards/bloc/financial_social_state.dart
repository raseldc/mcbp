import 'package:flutter/material.dart';
import 'package:mcbp/utils/helpers/string_resource.dart';

class FinancialSocialSate extends StatefulWidget {
  const FinancialSocialSate({ Key? key }) : super(key: key);

  @override
  State<FinancialSocialSate> createState() => _FinancialSocialSateState();
}

class _FinancialSocialSateState extends State<FinancialSocialSate> {

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
    loadData();
  }

  loadData(){

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
    );
  }
}

