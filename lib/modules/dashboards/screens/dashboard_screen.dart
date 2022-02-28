import 'package:flutter/material.dart';
import 'package:mcbp/widgets/navigation_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: Container(
        width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              color: Colors.amber,
            ),
            SizedBox(
                height: 10.0,
              ),
            Card(
              color: Colors.blue,
            ),
            SizedBox(
                height: 10.0,
            ),
            Card(
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    ),
    );
  }
}