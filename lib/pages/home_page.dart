import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import './dialog_newTodo.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Dismissible(
        background: Container(color: Colors.red, child: Icon(Icons.cancel)),
        key: UniqueKey(),
        child: Card(
            elevation: 5,
            color: element.completed == 1 ? Colors.blue : Colors.yellow[200],
            child: ListTile(
              title: Text(element.title),
              subtitle: Text(element.body),
              leading: element.icon,
              isThreeLine: true,
              onTap: () {
                setState(() {
                  if (this.todos[posicion].completed == 0) {
                    this.todos[posicion].completed = 1;
                  } else {
                    this.todos[posicion].completed = 0;
                  }
                });
              },
            )));
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );
   
    if (todo.title != "" && todo.body != "" ) {
      setState(() {
        print(todo);
        this.todos.add(todo);
      });
    }
  }
}
