import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends Equatable {
  @HiveField(0)
  final bool isTodoDone;
  @HiveField(1)
  final String todoContent;
  final String? todoId;
  const TodoModel({
    this.todoId,
    required this.isTodoDone,
    required this.todoContent,
  });

  @override
  List<Object?> get props => [isTodoDone, todoContent, todoId];
}
