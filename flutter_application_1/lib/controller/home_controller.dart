// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/apiservice.dart';
import 'package:flutter_application_1/model/todo_model.dart';


class TodoProvider extends ChangeNotifier{
  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();
  // ignore: non_constant_identifier_names
  List<TodoModel> TodoList=[];
  fetchTodo() async{
    try {
      List<TodoModel> listt= await TodoSevice().getTodo();
      TodoList=listt;
    } catch (error) {
       print('error loading notes:$error');
    }
    notifyListeners();
  }
  addTodo(BuildContext context) async {
  final name = title.text;
  final descriptions = description.text;
  TodoSevice().addTodo(TodoModel(title: name, description: descriptions))
      .then((_) {
        fetchTodo();
        Navigator.pop(context);
        notifyListeners();
      })
      .catchError((error) {
    
        print('Error adding notes: $error');
      });
}

  deletTodo({required id})async{
    await TodoSevice().deletTodo(id: id);
    fetchTodo();
    notifyListeners();
  }

  updateTodo({required id}){
   var editTitle=title.text;
   var editdescription=description.text;
   fetchTodo();
   TodoSevice().editTodo(value: TodoModel(title: editTitle, description: editdescription), id: id);
   notifyListeners();
  }
}