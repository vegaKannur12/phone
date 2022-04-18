// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// class MyHomePage extends StatefulWidget {
//   // MyHomePage({Key key, this.title}) : super(key: key);

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> widgetList = ["orange.png", "Pink.png", "Green.png", "red.png"];
//   Future<ImageInfo> getImageInfo(Image img) async {
//     final c = new Completer<ImageInfo>();
//     img.image
//         .resolve(new ImageConfiguration())
//         .addListener(new ImageStreamListener((ImageInfo i, bool _) {
//       c.complete(i);
//     }));
//     return c.future;
//   }

//   ////////////////////////////

//   assetimagesize() async {
//     final Image image = Image(image: AssetImage('asset/Green.png'));
//     Completer<ui.Image> completer = new Completer<ui.Image>();
//     image.image
//         .resolve(new ImageConfiguration())
//         .addListener(new ImageStreamListener((ImageInfo image, bool _) {
//       completer.complete(image.image);
//     }));
//     ui.Image info = await completer.future;
//     int width = info.width;
//     int height = info.height;
//     print("asset image height:${height}");
//     print("asset image width:${width}");

//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     /*24 is for notification bar on Android*/
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;

//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("gridview"),
//       ),
//       // body: new Container(
//       //   child: new GridView.count(
//       //     crossAxisSpacing: 2,
//       //     crossAxisCount: 2,
//       //     mainAxisSpacing: 2,

//       //     childAspectRatio: (itemWidth / itemHeight),
//       //     controller: new ScrollController(keepScrollOffset: true),
//       //     shrinkWrap: true,
//       //     scrollDirection: Axis.vertical,
//       //     children: widgetList.map((String value) {
//       //       return new Flexible(

//       //           child: Image.asset("asset/${value}"),

//       //       );
//       //     }).toList(),
//       //   ),
//       // ),

//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               child: Text("size"),
//               onPressed: () async {
//                 Image image = Image.network(
//                     "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?cs=srgb&dl=pexels-jonas-kakaroto-736230.jpg&fm=jpg",);
//                 ImageInfo info = await getImageInfo(image);
//                 print("image height:${info.image.height}");
//                 print("image width :${info.image.width}");

//               },
//             ),
//              ElevatedButton(
//               child: Text("asset image"),
//               onPressed: () async {
//                 assetimagesize();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


