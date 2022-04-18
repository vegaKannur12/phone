import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage(int col, double cont_actual_h_prop, List<String> widgetList, double paddingbottom, double paddingtop, double paddingright, double paddingleft, double description1height, double description2height);

  int? col;
  double cont_actual_h_prop;
  List<String> widgetList = [];
  double paddingtop;
  double paddingbottom;
  double paddingleft;
  double paddingright;
  double? imageActualheight;
  double? containerActualHieght;
  double? imageActualWidth;
  double description1Height;
  double description2Height;
  MyHomePage({
    required this.col,
    required this.cont_actual_h_prop,
    required this.widgetList,
    required this.paddingtop,
    required this.paddingbottom,
    required this.paddingleft,
    required this.paddingright,
    required this.containerActualHieght,
    required this.imageActualheight,
    required this.imageActualWidth,
    required this.description1Height,
    required this.description2Height
  });
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int col = 1;
  double paddingtop = 5;
  double paddingbottom = 5;
  double paddingleft = 5;
  double paddingright = 5;
  int? imgwidth;
  int? imgheight;

  double imagewidth = 600;
  double imageheight = 800;

  double description1Height = 20;
  double description2Height = 10;
  double? imageratio;

  double? containerHeight;
  double containerWidth = 0;
  double containerPropotion = 0;

  List<String> widgetList = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
  ];
  List<Map<String, dynamic>> sizesImage = [];

  @override
  Widget build(BuildContext context) {
    double? imageActualWidth;
    double? actualPadding;
    double? imageActualheight;
    double? containerActualHieght;
    double newimageHt;
    double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height-kToolbarHeight-24;
    double screenheight = MediaQuery.of(context).size.height;

    double cont_actual_h_prop;
    print("screen height : ${screenheight}, screen width : ${screenwidth}");
    containerHeight = imageheight +
        description1Height +
        description2Height +
        paddingtop +
        paddingbottom;
    print("containerHeight : ${containerHeight}");
    containerWidth = imagewidth + paddingleft + paddingright;
    print("containerWidth : ${containerWidth}");

    double colwidth = screenwidth / col;
    print("colwidth : ${colwidth}");

    double colwidth_Wopadd = colwidth - paddingleft - paddingright;
    print("colwidth_Wopadd : ${colwidth_Wopadd}");

    containerPropotion = colwidth_Wopadd / imagewidth;
    print("containerPropotion : ${containerPropotion}");

    imageratio = imageheight / imagewidth;
    print("imageratio : ${imageratio}");

    imageActualWidth = containerPropotion * imagewidth;

    imageActualheight = imageActualWidth * imageratio!;
    print(
        "imageActualWidth : ${imageActualWidth},imageActualheight : ${imageActualheight}");

    double containerAcWidth = imageActualWidth + paddingleft + paddingright;
    print("containerAcWidth : ${containerAcWidth}");

    containerActualHieght = imageActualheight +
        description1Height +
        description2Height +
        paddingbottom +
        paddingtop;
    print("containerActualHieght : ${containerActualHieght}");
    if (containerActualHieght > screenheight) {
      imageheight = screenheight -
          description1Height -
          description2Height -
          paddingbottom -
          paddingtop;
      print("newimageHt : ${imageheight}");
      imagewidth = imageheight / imageratio!;
      print("imagewidth : ${imagewidth}");

      containerActualHieght = imageheight +
          description1Height +
          description2Height +
          paddingbottom +
          paddingtop;
      print("containerActualHieght : ${containerActualHieght}");
      cont_actual_h_prop =
          // 1 - ((screenheight / (2/col))/ containerActualHieght);
          1 - (screenheight / 4 / containerActualHieght);
      print("cont_actual_h_prop : ${cont_actual_h_prop}");
    } else {
      cont_actual_h_prop = (screenheight / 2 / containerActualHieght);
      print("cont_actual_h_prop : ${cont_actual_h_prop}");
    }

    ////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: const Text("gridview"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          // mainAxisExtent: 150,
          // childAspectRatio: containerWidth/containerActualHieght,
          childAspectRatio: widget.cont_actual_h_prop,
        ),
        itemCount: widget.widgetList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
//remove color to make it transpatent
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.white)),
            height: widget.containerActualHieght,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: widget.paddingbottom,
                  top: widget.paddingtop,
                  left: widget.paddingleft,
                  right: widget.paddingright),
              child: Column(
                children: [
                  Expanded(
                    // height: imageActualheight,
                    // flex:9,
                    child: Image.asset(
                      "asset/${widget.widgetList[index]}",
                      height: widget.imageActualheight,
                      width: widget.imageActualWidth,
                      filterQuality: FilterQuality.high,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      color: Colors.red,
                      height: widget.description1Height,
                      child: Text("Flower")),
                  // SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    height: widget.description2Height,
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
