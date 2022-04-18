// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ScrollController _scrollController = new ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: ListView.builder(
//         controller: _scrollController,
//         itemCount: 50,
//         itemBuilder: (_, index) =>
//             ListTile(title: Text('ListTile ' + index.toString())),
//       ),
//       bottomSheet: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             child: Text("Start Down"),
//             onPressed: () {
//               setState(() {
//                 _scrollController.animateTo(
//                     _scrollController.position.maxScrollExtent,
//                     duration: Duration(milliseconds: 5000),
//                     curve: Curves.fastOutSlowIn);
//               });
//             },
//           ),
//           ElevatedButton(
//             child: Text("Stop"),
//             onPressed: () {
//               setState(() {
//                 _scrollController.animateTo(_scrollController.offset,
//                     duration: Duration(milliseconds: 5000),
//                     curve: Curves.fastOutSlowIn);
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }