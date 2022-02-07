import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("MCBP")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to MCBP"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
