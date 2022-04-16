import 'package:flutter/material.dart';
import 'package:mcbp/presentation/dashboard/dashboard_screen.dart';
import 'package:mcbp/presentation/registration/registration_screen.dart';
import 'package:mcbp/presentation/resources/colors.dart';
import 'package:mcbp/presentation/resources/string_resource.dart';
import 'package:mcbp/presentation/resources/style.dart';

import '../modules/dashboards/screens/district_screen.dart';
import '../modules/dashboards/screens/user_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Pijush Sukanta';
    final email = 'pijushsukanta.com';
    final urlImage =
        'http://103.181.42.142:8001/imlma/resources/img/mowca_logo5.png';

    return Drawer(
      child: Material(
        color: Colors.blueGrey,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'Sarah Abs',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const Divider(color: Colors.white70),
                  ExpansionTile(
                    title: Text(StringResource.union,style: getMediumStyle(color: Colors.white),),
                    backgroundColor: ColorManager.darkGrey,
                    children: [
                      const SizedBox(height: 24),
                      buildMenuItem(
                        text: StringResource.abedon,
                        icon: Icons.person_add,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: StringResource.talika,
                        icon: Icons.list,
                        onClicked: () => selectedItem(context, 1),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: (){},
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Image(image: AssetImage('assets/images/img.png'))
        ),
      );


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegistraionScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DistrictScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DistrictScreen(),
        ));
        break;
    }
  }
}