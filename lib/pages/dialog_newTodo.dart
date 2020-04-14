import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  
  _NewTodoDialogState createState() => _NewTodoDialogState();
  
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  @override
  
  Widget build( BuildContext context, ) {
    return AlertDialog(
      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Colors.yellow[200],
        title: Text(
          'New todo',
          style:
              
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        ),
        content: Column(children: <Widget>[
          TextField(
              controller: controllerTitle,
              decoration: InputDecoration(
                   labelText: 'Titulo')),
          TextField(
              controller: controllerBody,
              decoration: InputDecoration(
                  labelText: 'Descripción')),
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
                print(controllerTitle.value.text);
                final todo = new Todo(
                title: controllerTitle.value.text,
                body: controllerBody.value.text,
                completed: 0,);
                controllerTitle.clear();
               controllerBody.clear();

            Navigator.of(context).pop(todo);
              })
        ]);
  }
}
