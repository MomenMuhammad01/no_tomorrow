import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_tomorrow/models/todo_model.dart';
import 'package:no_tomorrow/utils/app_constants.dart';

class TodoService {
  final Box<TodoModel> task = Hive.box(todoDataBaseName);

  Future<List<TodoModel>> getAllTasks() async {
    final List<TodoModel> allTasks = task.values.map<TodoModel>((task) {
      return TodoModel(
        todoContent: task.todoContent,
        isTodoDone: task.isTodoDone,
        todoId: task.key,
      );
    }).toList();
    return allTasks;
  }

  Future<List<TodoModel>> addNewTask(String todoContent) async {
    task.put(
      DateTime.now().millisecondsSinceEpoch.toString(),
      TodoModel(todoContent: todoContent, isTodoDone: false),
    );
    final getTaskList = getAllTasks();
    return getTaskList;
  }

  Future<List<TodoModel>> updateExistingTask(
      bool isTodoDone, String todoContent, String todoId) async {
    await task.put(
        todoId, TodoModel(isTodoDone: isTodoDone, todoContent: todoContent));
    final getTaskList = getAllTasks();
    return getTaskList;
  }

  Future<List<TodoModel>> deleteAllTasks() async {
    task.clear();
    final getTaskList = getAllTasks();
    return getTaskList;
  }

  Future<List<TodoModel>> deleteOneTask(String todoId) async {
    await task.delete(todoId);
    final getTaskList = getAllTasks();
    return getTaskList;
  }
}
