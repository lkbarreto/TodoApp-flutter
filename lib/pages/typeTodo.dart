import 'package:flutter/material.dart';

class TodoTypeDropdown extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  TodoTypeDropdown({
    @required this.onChangedValue,
    this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return dropdownButton();
  }

  Widget dropdownButton() {
    print(selected);
    return DropdownButton<String>(
      onChanged: (String newValue) {
        onChangedValue(newValue);
      },
      value: selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      items: <String>['DEFAULT', 'CALL', 'HOMEWORK']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
