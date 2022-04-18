import 'package:flutter/material.dart';

class ImagePlacing extends StatefulWidget {
  int col = 1;
  double padding = 5;
  double imageheight = 400;
  double imagewidth = 600;

  double description1Height = 20.0;
  double description2Height = 30.0;
  double? imageratio;

  double? containerHeight;
  double containerWidth = 1.0;
  double containerPropotion = 20;
  // const ImagePlacing({Key? key}) : super(key: key);

  @override
  State<ImagePlacing> createState() => _ImagePlacingState();
}

class _ImagePlacingState extends State<ImagePlacing> {
  get description1Height => null;

  get description2Height => null;

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////////
    double? imageActualWidth;
    double? actualPadding;
    double? imageActualheight;
    double? containerActualHieght;
    double totalwidth = MediaQuery.of(context).size.width;
    double totalheight = MediaQuery.of(context).size.height;

    print(DateTime.now());
    print("device width:${totalwidth}");
    print("device totalheight:${totalheight}");
    
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    /*24 is for notification bar on Android*/
    final double screenHeight = (totalheight - kToolbarHeight - 24);
    final double screenWidth = totalwidth;

    final double itemHeight = screenHeight / 2;
    final double colWidth = screenWidth / 2;
    //////////////////////////////////////////////
    print("height:${itemHeight}");
    print("width:${colWidth}");
//////////////////////////////////////////////////////////
    if (imageActualheight != null && actualPadding != null) {
      containerActualHieght = 2 * actualPadding + imageActualheight;
      print("actual container height........${containerActualHieght}");
    }
    double ratio = (colWidth / itemHeight);
    // print("ratio:${ratio}");
    double newheight = (ratio * colWidth);
    ///////////////////////////////////////////
    return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                      "asset/cropped.jpg",
                      //  height:containerActualHieght!=null?containerActualHieght:200,
                      height: imageActualheight,
                      width: imageActualWidth,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                alignment: Alignment.center,
                // width: containerActualHieght,
                height: 500,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                //     // fit: BoxFit.cover
                //   ),
                // ),
              ),
              Container(
                  // width: double.infinity,
                  color: Colors.red,
                  height: description1Height,
                  child: Text("Flower")),
              // SizedBox(height: 10),
              Container(
                // width: double.infinity,
                color: Colors.green,
                height: description2Height,
                child: Text(
                  "rose beautifull flower r range of colour, size, form fdgfg fdgd",
                  style: TextStyle(fontSize: 12, color: Colors.purple),
                ),
              ),
            ],
          ),
        ));
  }
}
