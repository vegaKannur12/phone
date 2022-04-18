import 'package:flutter/material.dart';

import '../components/curveddesign.dart';

class MyBookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom paint Demo'),
      ),
      body: Container(
        child: Column(
          children: [
            Text("LOGIN"),
            TextField(),
            TextField(),
            Center(
              child: CustomPaint(
                size: Size(500,600), 
                painter: CurvedPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////curve/////////////////////////
