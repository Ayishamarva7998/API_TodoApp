import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/todo_model.dart';


class TodoSevice {
  Dio dio = Dio();
  var endPointUrl =
      'https://65aa5827081bd82e1d96b5e4.mockapi.io/todo/todo';

  Future<List<TodoModel>>  getTodo() async {
    try {
      Response response = await Dio().get(endPointUrl);
      if (response.statusCode == 200) {
        var jsonList = response.data as List;
        List<TodoModel> datas = jsonList.map((json) {
          return TodoModel.fromJson(json);
        }).toList();
        return datas;
      } else {
        throw Exception('fainld loaded notes');
      }
    } catch (error) {
      throw Exception('Failed to load notes: $error');
    }
  }

  addTodo(TodoModel value) async {
    try {
         var response = await dio.post(endPointUrl, data: value.toJson());
    return response.data; 

    } catch (e) {
      Exception(e);
    }
  }

  deletTodo({required id}) async {
    var deletUrl =
        'https://65aa5827081bd82e1d96b5e4.mockapi.io/todo/todo/$id';
    try {
      await dio.delete(deletUrl);
    } catch (e) {
      throw Exception(e);
    }
  }

  editTodo({required TodoModel value, required id}) async {
    var editUrl =
        'https://65aa5827081bd82e1d96b5e4.mockapi.io/todo/todo/$id';
    try {
      await dio.put(editUrl, data: value.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}