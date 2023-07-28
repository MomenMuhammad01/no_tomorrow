import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_tomorrow/models/todo_model.dart';
import 'package:no_tomorrow/services/todo_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoService _todoService = TodoService();
  TodoCubit() : super(TodoInitialState());
   Future<void> getTodoTasks() async {
    try{
      List<TodoModel> todoList = await _todoService.getTodoList();
      emit(TodoLoadedState(todoList));
    } on Exception{
      emit(TodoFailState());
    }
    
  }

  Future<void> addNewTodoTask(String todoContent) async {
    try{
      List<TodoModel> todoList = await _todoService.addNewTodo(todoContent);
      emit(TodoLoadedState(todoList));
    } on Exception{
      emit(TodoFailState());
    }
    
  }

  Future<void> updateTodoTask(String todoContent, bool isTodoDone, String todoId) async {
    try{
      List<TodoModel> todoList = await _todoService.updateExistingTodo(isTodoDone, todoContent, todoId);
      emit(TodoLoadedState(todoList));
    }on Exception{
      emit(TodoFailState());
    }
  }

  Future<void> deleteAllTasks() async {
    try{
      List<TodoModel> todoList = await _todoService.deleteAllTodo();
      emit(TodoLoadedState(todoList));
      emit(TodoListDeletedState());
    }on Exception{
      emit(TodoFailState());
    }
    
  }

  Future<void> deleteOneTask(String todoId) async {
    try{
      List<TodoModel> todoList = await _todoService.deleteOneTodo(todoId);
      emit(TodoLoadedState(todoList));
    }on Exception{
      emit(TodoFailState());
    }
    
  }

  void noTaskToDelete() {
    emit(NoTaskToDeleteState());
  }
}
