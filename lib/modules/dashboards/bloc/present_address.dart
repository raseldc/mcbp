import 'package:flutter/material.dart';

class PresentAddress extends StatelessWidget {

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
        title: Text("বববর্তমান ঠিকানা"),
        childrenPadding: EdgeInsets.all(8.0),
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "্যবহারকারী আইডি",
              labelText: "ব্যবহারকারী আইডি",
            ),
            onChanged: (value){

            },
          ),
          SizedBox(
            height: 20.0,
          ),

        ],
      ),
    );
  }
}
