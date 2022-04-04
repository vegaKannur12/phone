import 'package:flutter/material.dart';
import 'package:phone/screen/animationimage.dart';
import 'package:phone/screen/dropdowndata.dart';
import 'package:phone/screen/imageplace.dart';
import 'package:phone/screen/phonedetails.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}
