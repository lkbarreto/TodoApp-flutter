import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';
import './typeTodo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String _dropSelected = "DEFAULT";
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: Colors.yellow[200],
            title: Text(
              'New todo',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20.0),
            ),
            content: Column(children: <Widget>[
              TextField(
                  controller: controllerTitle,
                  decoration: InputDecoration(labelText: 'Titulo')),
              TextField(
                  controller: controllerBody,
                  decoration: InputDecoration(labelText: 'Descripción')),
              TodoTypeDropdown(
                  selected: _dropSelected,
                  onChangedValue: (value) => setState(() {
                        _dropSelected = value;
                      }))
            ]),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('Añadir'),
                  onPressed: () {
                    Icon icon;
                    print(_dropSelected);
                    switch (_dropSelected) {
                      case "DEFAULT":
                        icon = Icon(Icons.check, size: 72.0);
                        break;
                      case "CALL":
                        icon = Icon(Icons.call, size: 72.0);
                        break;
                      case "HOME_WORK":
                        icon = Icon(Icons.contacts, size: 72.0);
                        break;
                      default:
                        icon = Icon(Icons.dialpad, size: 72.0);
                        break;
                    }

                    final todo = new Todo(
                      title: controllerTitle.value.text,
                      body: controllerBody.value.text,
                      icon: icon,
                      completed: 0,
                    );
                    controllerTitle.clear();
                    controllerBody.clear();

                    Navigator.of(context).pop(todo);
                  })
            ])
      ],
    );
  }
}
