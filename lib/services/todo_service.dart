import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_tomorrow/models/todo_model.dart';
import 'package:no_tomorrow/utils/app_constants.dart';

class TodoService {
  final Box<TodoModel> task = Hive.box(todoDataBaseName);

  Future<List<TodoModel>> getTodoList() async {
    final List<TodoModel> allTasks = task.values.map<TodoModel>((task) {
      return TodoModel(
        todoContent: task.todoContent,
        isTodoDone: task.isTodoDone,
        todoId: task.key,
      );
    }).toList();
    return allTasks;
  }

  Future<List<TodoModel>> addNewTodo(String todoContent) async {
    task.put(
      DateTime.now().millisecondsSinceEpoch.toString(),
      TodoModel(todoContent: todoContent, isTodoDone: false),
    );
    final getTaskList = getTodoList();
    return getTaskList;
  }

  Future<List<TodoModel>> updateExistingTodo(
      bool isTodoDone, String todoContent, String todoId) async {
    await task.put(
        todoId, TodoModel(isTodoDone: isTodoDone, todoContent: todoContent));
    final getTaskList = getTodoList();
    return getTaskList;
  }

  Future<List<TodoModel>> deleteAllTodo() async {
    task.clear();
    final getTaskList = getTodoList();
    return getTaskList;
  }

  Future<List<TodoModel>> deleteOneTodo(String todoId) async {
    await task.delete(todoId);
    final getTaskList = getTodoList();
    return getTaskList;
  }
}
