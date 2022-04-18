import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../components/imageFuction.dart';

class PhotoViewDemo extends StatefulWidget {
  @override
  _PhotoViewDemoState createState() => _PhotoViewDemoState();
}

class _PhotoViewDemoState extends State<PhotoViewDemo> {
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
        listdata.imagesize(screenwidth, screenheight)[10];
    ////////////////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: Text("PhotoView Demo"),
      ),
      // add this body tag with container and photoview widget
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
              child: PhotoViewGallery.builder(
                itemCount: widgetList.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(
                      "asset/${widgetList[index]}",
                    ),
                    // minScale: PhotoViewComputedScale.contained * 0.3,
                    // maxScale: PhotoViewComputedScale.covered * 1,
                  );
                },
                scrollPhysics: AlwaysScrollableScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Theme.of(context).canvasColor,
                ),
                enableRotation: false,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    height: containerActualHieght,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded /
                              event.expectedTotalBytes!.toInt(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text("Images"),
            ),
          ],
        ),
      ),
    );
  }
}
