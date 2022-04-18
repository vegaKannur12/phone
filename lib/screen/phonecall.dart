// import 'package:flutter/material.dart';

// class PhoneImei extends StatefulWidget {
//   const PhoneImei({ Key? key }) : super(key: key);

//   @override
//   State<PhoneImei> createState() => _PhoneImeiState();
// }

// class _PhoneImeiState extends State<PhoneImei> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: ElevatedButton(
//             onPressed: (){},
//             child: Text("imei"),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp1 extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: textEditingController,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Phone number"),
              onSaved: (phoneNumber) {
                textEditingController.text = phoneNumber!;
              },
            ),
          ),
          ElevatedButton(
            child: Text("_launchPhoneURL"),
            onPressed: () {
              _launchPhoneURL(textEditingController.text);
            },
          ),
          ElevatedButton(
            child: Text("_callNumber"),
            onPressed: () {
              _callNumber(textEditingController.text);
            },
          )
        ],
      ),
    );
  }
}

_callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}

_launchPhoneURL(String phoneNumber) async {
  String url = 'tel:' + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
