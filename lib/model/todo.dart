
import 'package:flutter/material.dart';

class Todo {
  int id;
  String title;
  String body;
  int completed;
  Icon icon;
  Todo({this.title, this.body, this.completed, this.icon});
}
