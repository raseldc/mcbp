import 'package:flutter/material.dart';
import 'package:mcbp/domain/model/registration.dart';
import 'package:mcbp/presentation/resources/colors.dart';
import 'package:mcbp/presentation/resources/string_resource.dart';
import 'package:mcbp/presentation/resources/style.dart';

import '../../utils/services/mcbp_db.dart';
import '../../widgets/item_widget.dart';
import '../../widgets/navigation_drawer.dart';
import '../home/home_page.dart';

class RegistrationList extends StatefulWidget {
  const RegistrationList({ Key? key }) : super(key: key);

  @override
  State<RegistrationList> createState() => _RegistrationListState();
}

class _RegistrationListState extends State<RegistrationList> {

  final _search = TextEditingController();

  List<Registration> list = [];
  List<Registration> tempList = [];
  var db;

  @override
  void initState(){
    super.initState();
    db = McbpDatabase.instance;
    loadData();
  }

  loadData() async{
    var listItem = await db.registrationList();
    setState(() {
      list = listItem;
      tempList = listItem;
    });
    
  }

  void searchNid(String nid){
    var item = tempList.where((nationalId){
      return nationalId.nationalId!.contains(nid);
    }).toList();

    setState(() {
      if(item != null || item.isNotEmpty){
        list = item;
      }
    });
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
            title: Text(StringResource.talika),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: "Search",
                  ),
                  onChanged: searchNid,
                ),
                SizedBox(
                    height: 10.0,
                ),
                Expanded(
                  child:(list.isNotEmpty)? ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context,index)=> 
                      ItemWidget(item: list[index])
                  ):Center(
                    child: Text("No Data Found",style: getBoldStyle(color: ColorManager.lightGrey),),
                  )
                ),
            ],
          ),
        ),
      ), 
    );
  }
}