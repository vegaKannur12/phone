import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  late File imagefile;

  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(
        source: ImageSource.gallery,
      );
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        imagefile = File(imagepath);
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  cropImage() async {
    print("cropp image");
    File? croppedfile = await ImageCropper().cropImage(
        sourcePath: imagepath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Image Cropper',
            toolbarColor: Colors.deepPurpleAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));

    if (croppedfile != null) {
      imagefile = croppedfile;
      setState(() {});
    } else {
      print("Image is not cropped.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Open Image, Crop and Save"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              imagepath != ""
                  ? Flexible(child: Image.file(imagefile))
                  : Container(
                      child: Text("No Image selected."),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //open button ----------------
                  Flexible(
                    flex: 2,
                    child: ElevatedButton(
                        onPressed: () {
                          openImage();
                        },
                        child: Text("Open Image")),
                  ),

                  //crop button --------------------
                  imagepath != ""
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent),
                          onPressed: () {
                            cropImage();
                          },
                          child: Text("Crop Image"))
                      : Container(),

                  //save button -------------------
                  imagepath != ""
                      ? ElevatedButton(
                          onPressed: () async {
                            Uint8List bytes = await imagefile.readAsBytes();
                            var result = await ImageGallerySaver.saveImage(
                                bytes,
                                quality: 60,
                                name: "new_mage.jpg");
                            print(result);
                            if (result["isSuccess"] == true) {
                              print("Image saved successfully.");
                            } else {
                              print(result["errorMessage"]);
                            }
                          },
                          child: Text("Save Image"))
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }
}
