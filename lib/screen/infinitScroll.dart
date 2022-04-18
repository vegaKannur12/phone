import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaginationPgm extends StatefulWidget {
  const PaginationPgm({Key? key}) : super(key: key);

  @override
  State<PaginationPgm> createState() => _PaginationPgmState();
}

class _PaginationPgmState extends State<PaginationPgm> {
  final _scrollController = ScrollController();
  bool loading = true;
  bool allloading = false;
  List<String> item = [];

  mockFecth() async {
    if (allloading) {
      print("allloading");
      return;
    }
    setState(() {
      loading = true;
      print("loading");
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<String> newData = item.length >= 60
        ? []
        : List.generate(20, (index) => index.toString() * index);
    print("new data ${newData}");
    print(newData.length);
    if (newData.isNotEmpty) {
      item.addAll(newData);
    }
    setState(() {
      print("loading ${loading}");
      print("all loading ${allloading}");
      loading = false;
      allloading = newData.isEmpty;
    });
  }

  @override
  void initState() {
    mockFecth();
    print("old data");

    _scrollController.addListener(() async{
      print("Inside listener");
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        print('At the end');
        
        await Future.delayed(Duration(seconds: 2));
        mockFecth();
      }
    });
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: LayoutBuilder(
        builder: (context, Constraints) {
          if (item.isNotEmpty) {
            return Stack(
              children: [
                ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index < item.length) {
                        return ListTile(
                          title: Text("items......${item[index]}"),
                        );
                      } else {
                        return Container(
                          width: Constraints.maxWidth,
                          height: 50,
                          child: Center(
                            child: Text("Nothing more to load"),
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemCount: item.length + (allloading ? 1 : 0)),
                // Positioned(
                //     left: 0,
                //     bottom: 0,
                //     child: Container(
                //       width: Constraints.maxWidth,
                //       height: 80,
                //       child: Center(
                //         child: CircularProgressIndicator(),
                //       ),
                //     )),
              ],
            );
          } else {
            return Container(
              child: Center(
                child: Text("No data"),
                // CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
