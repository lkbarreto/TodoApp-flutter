import 'package:flutter/material.dart';

class TodoTypeDropdown extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  const TodoTypeDropdown({
    this.selected,
    this.onChangedValue,
  });
  @override
  Widget build(BuildContext context) {
    return dropdownButton();
  }

  Widget dropdownButton() {
    print(selected);
    return DropdownButton<String>(
      value: selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String value) {
        onChangedValue(value);
      },
      items: <String>['DEFAULT', 'CALL', 'HOME_WORK']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
