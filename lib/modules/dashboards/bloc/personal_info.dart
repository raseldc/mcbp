
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {


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
        title: Text("ব্যক্তিগত তথ্য"),
        childrenPadding: EdgeInsets.all(8.0),
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.person),
              hintText: "জাতীয় পরিচয় পত্র নং*",
              labelText: "জাতীয় পরিচয় পত্র নং*",
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
              hintText: "জন্ম তারিখ*",
              labelText: "জন্ম তারিখ*",
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
              hintText: "নাম (বাংলা)*",
              labelText: "নাম (বাংলা)",
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
              hintText: "নাম (ইংরেজি)*",
              labelText: "নাম (ইংরেজি)",
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
              hintText: "পিতার নাম*",
              labelText: "পিতার নাম",
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
              hintText: "মাতার নাম*",
              labelText: "মাতার নাম",
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
              hintText: "স্বামীর নাম*",
              labelText: "স্বামীর নাম",
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
              hintText: "যে নামে পরিচিত",
              labelText: "যে নামে পরিচিত",
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
              hintText: "জন্মস্থান*",
              labelText: "জন্মস্থান*",
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
              hintText: "ধর্ম*",
              labelText: "ধর্ম*",
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
              hintText: "মোবাইল নং",
              labelText: "মোবাইল নং",
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
              hintText: "শিক্ষাগত যোগ্যতা",
              labelText: "শিক্ষাগত যোগ্যতা",
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
              hintText: "রক্তের গ্রুপ",
              labelText: "রক্তের গ্রুপ",
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
              hintText: "বৈবাহিক তথ্য",
              labelText: "বৈবাহিক তথ্য",
            ),
            onChanged: (value){

            },
          ),

        ],
      ),
    );
  }
}
