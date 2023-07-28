part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();
  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}


class TodoLoadedState extends TodoState {
  final List<TodoModel> todoList;
  const TodoLoadedState(this.todoList);

  @override
  List<Object> get props => [todoList];
}
class TodoFailState extends TodoState {}
class TaskAddedState extends TodoState {}
class TodoListDeletedState extends TodoState {}
class NoTaskToDeleteState extends TodoState{}