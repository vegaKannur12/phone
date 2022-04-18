import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:phone/components/imageFuction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  imageResize size = imageResize();
  // final listdata;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight =
        MediaQuery.of(context).size.height - kToolbarHeight - 24;

    size.imagesize(
      screenwidth,
      screenheight,
    );
    final listdata = imageResize();
    int col = listdata.imagesize(screenwidth, screenheight)[0];
    List<String> widgetList = listdata.imagesize(screenwidth, screenheight)[1];
    double paddingbottom = listdata.imagesize(screenwidth, screenheight)[2];
    double paddingtop = listdata.imagesize(screenwidth, screenheight)[3];
    double paddingleft = listdata.imagesize(screenwidth, screenheight)[4];
    double paddingright = listdata.imagesize(screenwidth, screenheight)[5];
    double description1Height =
        listdata.imagesize(screenwidth, screenheight)[6];
    double description2Height =
        listdata.imagesize(screenwidth, screenheight)[7];
    double cont_actual_h_prop =
        listdata.imagesize(screenwidth, screenheight)[8];
    double imageActualWidth = listdata.imagesize(screenwidth, screenheight)[9];
    double imageActualheight =
        listdata.imagesize(screenwidth, screenheight)[10];
    double containerActualHieght =
        listdata.imagesize(screenwidth, screenheight)[10];
    print("widget list ${widgetList.length}");
    print("container propotion ${cont_actual_h_prop}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("gridview"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: col,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            // childAspectRatio: widget.cont_actual_h_prop,
            childAspectRatio: cont_actual_h_prop),
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.white)),
            height: containerActualHieght,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: paddingbottom,
                  top: paddingtop,
                  left: paddingleft,
                  right: paddingright),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      "asset/${widgetList[index]}",
                      height: imageActualheight,
                      width: imageActualWidth,
                      filterQuality: FilterQuality.high,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      color: Colors.red,
                      height: description1Height,
                      child: Text("Flower")),
                  // SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    height: description2Height,
                    child: Text(
                      "rose beautifull flower r range of colour, size,",
                      style: TextStyle(fontSize: 12, color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
