import 'package:flutter/material.dart';

class DropDowndesign extends StatefulWidget {
  const DropDowndesign({Key? key}) : super(key: key);

  @override
  State<DropDowndesign> createState() => _DropDowndesignState();
}

class _DropDowndesignState extends State<DropDowndesign> {
  TextEditingController controller = TextEditingController();
  String selectedValue = "USA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Column(
        children: [
          Text("DropDown"),
          Center(
            child: DropdownButton(
              style: TextStyle(color: Colors.red, fontSize: 30),
              value: selectedValue,
              items: dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  print("selectedValue............${selectedValue}");
                });
              },
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter your name',
              // prefixText: selectedValue,
            ),
          )
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return menuItems;
}
