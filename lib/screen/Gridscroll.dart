import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomeScreen1> {
  List<String> dataList = [];
  bool isLoading = false;
  int pageCount = 1;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ////LOADING FIRST  DATA
    addItemIntoLisT(1);
    _scrollController.addListener(() async {
      print(dataList);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gridview',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: Scaffold(
            appBar: new AppBar(),
            body: GridView.count(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              physics: const AlwaysScrollableScrollPhysics(),
              children: dataList.map((value) {
                if (dataList.isEmpty) {
                  return Container(
                    child: Center(
                      child: Text("No data"),
                      // CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Item ${value}"),
                  );
                }
              }).toList(),
            )));
  }

  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    print("comes to bottom $isLoading");
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom $isLoading");
        isLoading = true;

        if (isLoading) {
          print("RUNNING LOAD MORE");

          pageCount = pageCount + 1;

          addItemIntoLisT(pageCount);
        }
      });
    }
  }

  ////ADDING DATA INTO ARRAYLIST
  void addItemIntoLisT(var pageCount) {
    for (int i = (pageCount * 20) - 20; i < pageCount * 20; i++) {
      dataList.add(i.toString());
      print("data list......${pageCount}");
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
