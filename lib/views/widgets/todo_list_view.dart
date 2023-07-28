import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_tomorrow/controllers/todo_cubit/todo_cubit.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({ super.key,required this.tasksLists});

  final List tasksLists;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 150.ms)],
      child: ListView.builder(
          itemCount: tasksLists.length,
          padding: const EdgeInsets.all(70),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Animate(
              effects: [SlideEffect(duration: 250.ms)],
              child: Center(
                    child: GestureDetector(
                      onTap: () => BlocProvider.of<TodoCubit>(context)
                          .updateTodoTask(
                              tasksLists[index].todoContent,
                              tasksLists[index].isTodoDone ? false : true,
                              tasksLists[index].todoId),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Animate(
                          effects: [FadeEffect(duration: 150.ms)],
                          child: Dismissible(
                              onDismissed: (direction) =>
                                  BlocProvider.of<TodoCubit>(context).deleteOneTask(tasksLists[index].todoId),
                              key: ObjectKey(tasksLists[index]),
                              child: Text(
                                tasksLists[index].todoContent,
                                style: tasksLists[index].isTodoDone
                                    ? Theme.of(context).textTheme.bodySmall
                                    : Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ),
                        ),
                      ),
                  ),
            );
          },
      ),
    );
  }
}
