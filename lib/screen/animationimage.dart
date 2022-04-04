/////////////// image animation forward////////////////////////
// import 'package:flutter/material.dart';
// import 'dart:ui';

// class Option1 extends StatefulWidget {
//   @override
//   _Option1State createState() => _Option1State();
// }

// class _Option1State extends State<Option1> with TickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController animationController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 3));
//     animation = Tween<double>(begin: 0, end: -300).animate(animationController)
//       ..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Align(
//           alignment: AlignmentDirectional(0,0.7),
//           child: Transform.translate(
//             offset: Offset(0, animation.value),
//             child: Container(
//               height: 250,
//               width: 170,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage('asset/hib.jpg'),
//               )),
//             ),
//           ),
//         ),
//         Align(
//           alignment: AlignmentDirectional.bottomCenter,
//           child: ElevatedButton(
//             onPressed: () {
//               animationController.forward();
//             },
//             child: Text('Go'),
//             // color: Colors.red,
//             // textColor: Colors.yellowAccent,
//             // shape: BeveledRectangleBorder(
//             //     borderRadius: BorderRadius.all(Radius.circular(20))),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
// }
/////////// animation /////////////////////
// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 1),
//     vsync: this,
//   )..repeat(reverse: true);
//   late final Animation<Offset> _offsetAnimation = Tween<Offset>(
//     begin: Offset.zero,
//     end: const Offset(1.5, 0.0),
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.elasticIn,
//   ));

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Text("Helooo",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.red,)),
//       ),
//     );
//   }
// }
//////////////////scale transaction////////////////////////////
import 'package:flutter/material.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: const Center(
          child: Text("Helooo",
              style: TextStyle(
                fontSize: 50,  
                fontWeight: FontWeight.bold,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
