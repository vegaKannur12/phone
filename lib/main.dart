import 'package:flutter/material.dart';
import 'package:phone/screen/Photoview.dart';
import 'package:photo_view/photo_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Example',
      home: PhotoViewDemo(),
    );
  }
}

