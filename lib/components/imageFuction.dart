class imageResize {
  imagesize(double screenwidth, double screenheight){
    int col = 1;
    double paddingtop = 5;
    double paddingbottom = 5;
    double paddingleft = 5;
    double paddingright = 5;
    int? imgwidth;
    int? imgheight;

    double imagewidth = 600;
    double imageheight = 800;

    double description1Height = 40;
    double description2Height = 10;
    double? imageratio;

    double? containerHeight;
    double containerWidth = 0;
    double containerPropotion = 0;

    List<String> widgetList = [
      "1.jpg",
      "2.jpg",
      "3.jpg"
    ];
    List<Map<String, dynamic>> sizesImage = [];
    double? imageActualWidth;
    double? actualPadding;
    double? imageActualheight;
    double? containerActualHieght;
    double newimageHt;

    print("screen width:${screenwidth}");
    print("screen height:${screenheight}");
///////////////////////////////////////
    double cont_actual_h_prop;
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

    imageActualheight = imageActualWidth * imageratio;
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
      imagewidth = imageheight / imageratio;
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
      return;
    } else {
      cont_actual_h_prop = (screenheight / (col*2) / containerActualHieght);
      print("cont_actual_h_prop : ${cont_actual_h_prop}");
      return [
        col,
        widgetList,
        paddingbottom,
        paddingtop,
        paddingleft,
        paddingright,
        description1Height,
        description2Height,
        cont_actual_h_prop,
        imageActualWidth,
        imageActualheight,
        containerActualHieght
      ];
    }
  }
}









// import 'package:flutter/material.dart';
// import '../screen/imagePlace.dart';

// class ImageResize extends StatefulWidget {
//   const ImageResize({Key? key}) : super(key: key);
//   @override
//   State<ImageResize> createState() => _ImageResizeState();
// }

// class _ImageResizeState extends State<ImageResize> {
//   @override
//   Widget build(
//     BuildContext context,
//   ) {
  
//     double screenwidth = MediaQuery.of(context).size.width;
//     // double screenheight = MediaQuery.of(context).size.height-kToolbarHeight-24;
//     double screenheight = MediaQuery.of(context).size.height;

//     double cont_actual_h_prop;
//     print("screen height : ${screenheight}, screen width : ${screenwidth}");
//     containerHeight = imageheight +
//         description1Height +
//         description2Height +
//         paddingtop +
//         paddingbottom;
//     print("containerHeight : ${containerHeight}");
//     containerWidth = imagewidth + paddingleft + paddingright;
//     print("containerWidth : ${containerWidth}");

//     double colwidth = screenwidth / col;
//     print("colwidth : ${colwidth}");

//     double colwidth_Wopadd = colwidth - paddingleft - paddingright;
//     print("colwidth_Wopadd : ${colwidth_Wopadd}");

//     containerPropotion = colwidth_Wopadd / imagewidth;
//     print("containerPropotion : ${containerPropotion}");

//     imageratio = imageheight / imagewidth;
//     print("imageratio : ${imageratio}");

//     imageActualWidth = containerPropotion * imagewidth;

//     imageActualheight = imageActualWidth * imageratio!;
//     print(
//         "imageActualWidth : ${imageActualWidth},imageActualheight : ${imageActualheight}");

//     double containerAcWidth = imageActualWidth + paddingleft + paddingright;
//     print("containerAcWidth : ${containerAcWidth}");

//     containerActualHieght = imageActualheight +
//         description1Height +
//         description2Height +
//         paddingbottom +
//         paddingtop;
//     print("containerActualHieght : ${containerActualHieght}");
//     if (containerActualHieght > screenheight) {
//       imageheight = screenheight -
//           description1Height -
//           description2Height -
//           paddingbottom -
//           paddingtop;
//       print("newimageHt : ${imageheight}");
//       imagewidth = imageheight / imageratio!;
//       print("imagewidth : ${imagewidth}");

//       containerActualHieght = imageheight +
//           description1Height +
//           description2Height +
//           paddingbottom +
//           paddingtop;
//       print("containerActualHieght : ${containerActualHieght}");
//       cont_actual_h_prop =
//           // 1 - ((screenheight / (2/col))/ containerActualHieght);
//           1 - (screenheight / 4 / containerActualHieght);
//       print("cont_actual_h_prop : ${cont_actual_h_prop}");
//     } else {
//       cont_actual_h_prop = (screenheight / 2 / containerActualHieght);
//       print("cont_actual_h_prop : ${cont_actual_h_prop}");
//     }

//     return Scaffold(
//       body: MyHomePage(
//         // col,
//         // cont_actual_h_prop,
//         // widgetList,
//         // paddingbottom,
//         // paddingtop,
//         // paddingright,
//         // paddingleft,
//         // description1Height,
//         // description2Height,
//       ),
//     );
//   }
// }
