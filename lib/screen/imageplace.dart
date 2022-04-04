import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> widgetList = ["hib.jpg", "low.jpg", "vio.jpg", "high.jpg"];
  Future<ImageInfo> getImageInfo(Image img) async {
    final c = new Completer<ImageInfo>();
    img.image
        .resolve(new ImageConfiguration())
        .addListener(new ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    print("device height:${devicePixelRatio}");
    print("total height:${height}");
    print("total width:${width}");
    /*24 is for notification bar on Android*/
    final double itemHeight = (height - kToolbarHeight - 24);
    final double itemWidth = width;
    print("height:${itemHeight}");
    print("width:${itemWidth}");
    return Scaffold(
      appBar: new AppBar(
        title: new Text("gridview"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisSpacing: 3,
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          childAspectRatio: (itemWidth / itemHeight),
          controller: ScrollController(keepScrollOffset: true),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: widgetList.map((String value) {
            return Container(
              decoration: new BoxDecoration(
                  image:  DecorationImage(
                image: NetworkImage("https://cdn.shopify.com/s/files/1/0301/6910/4515/products/forsythia-flower-yellow-31-1_1200x.jpg?v=1584025626"),
                fit: BoxFit.fill,
                filterQuality:FilterQuality.high,
              )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
