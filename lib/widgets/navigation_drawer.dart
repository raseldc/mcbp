import 'package:flutter/material.dart';
import 'package:mcbp/modules/dashboards/screens/dashboard_screen.dart';
import 'package:mcbp/modules/dashboards/screens/registration_screen.dart';

import '../modules/dashboards/screens/district_screen.dart';
import '../modules/dashboards/screens/user_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Pijush Sukanta';
    final email = 'pijushsukanta.com';
    final urlImage =
        'https://lh3.googleusercontent.com/ogw/ADea4I5_vRBhDeBkgFIBObkSIiTSHf3riBRIt9EQmz1bdVw=s32-c-mo';

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
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'আবেদন',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'তালিকা',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
          
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Divisions',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  
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
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

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