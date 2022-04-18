import 'package:flutter/material.dart';

import '../components/imageFuction.dart';

class SingleImage extends StatefulWidget {
  const SingleImage({Key? key}) : super(key: key);

  @override
  State<SingleImage> createState() => _SingleImageState();
}

class _SingleImageState extends State<SingleImage> {
  final listdata = imageResize();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight =
        MediaQuery.of(context).size.height - kToolbarHeight - 24;
    List<String> widgetList = listdata.imagesize(screenwidth, screenheight)[1];
    double paddingbottom = listdata.imagesize(screenwidth, screenheight)[2];
    double paddingtop = listdata.imagesize(screenwidth, screenheight)[3];
    double paddingleft = listdata.imagesize(screenwidth, screenheight)[4];
    double paddingright = listdata.imagesize(screenwidth, screenheight)[5];
    double description1Height =
        listdata.imagesize(screenwidth, screenheight)[6];
    double imageActualWidth = listdata.imagesize(screenwidth, screenheight)[9];
    double imageActualheight =
        listdata.imagesize(screenwidth, screenheight)[10];
    double containerActualHieght =
        listdata.imagesize(screenwidth, screenheight)[11];
    return Scaffold(
      appBar: AppBar(title: Text("Dress")),
      body: Padding(
        padding: EdgeInsets.only(
            bottom: paddingbottom,
            top: paddingtop,
            left: paddingleft,
            right: paddingright),
        child: Column(
          children: [
            Container(
              height: containerActualHieght,
              child:widgetList.length != null?Image.asset(
                "asset/${widgetList[1]}",
                width: imageActualWidth,
                height: imageActualheight,
              ):Image.asset("asset/hib.jpg")
            ),
            Container(
                height: description1Height,
                child: Text("Flower")),
          ],
        ),
      ),
    );
  }
}
