import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_tomorrow/controllers/theme_cubit/theme_cubit.dart';
import 'package:no_tomorrow/controllers/todo_cubit/todo_cubit.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';
import 'package:no_tomorrow/views/widgets/all_todo_deleted.dart';
import 'package:no_tomorrow/views/widgets/error_widget.dart';
import 'package:no_tomorrow/views/widgets/no_todo_found.dart';
import 'package:no_tomorrow/views/widgets/no_todo_to_delete.dart';
import 'package:no_tomorrow/views/widgets/todo_input_field.dart';
import 'package:no_tomorrow/views/widgets/todo_list_view.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                iconSize: 30,
                icon: Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).changeCurrentTheme(!state.isDarkMode);
                },
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                return IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                  onPressed: () {
                    if (state is TodoLoadedState &&
                        state.todoList.isNotEmpty) {
                      BlocProvider.of<TodoCubit>(context).deleteAllTasks();
                    } else {
                      BlocProvider.of<TodoCubit>(context).noTaskToDelete();
                    }
                  }
                );
              },
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                StringsManager.todayTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                StringsManager.tomorrowTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              bloc: context.read<TodoCubit>()..getTodoTasks(),
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is TodoLoadedState && state.todoList.isEmpty) {
                  return const NoTodoFound();
                } else if (state is TodoLoadedState &&
                    state.todoList.isNotEmpty) {
                  return TodoListView(tasksLists: state.todoList);
                } else if (state is TodoListDeletedState) {
                  return const TodoDeleted();
                } else if (state is NoTaskToDeleteState) {
                  return const NoTodoToDelete();
                } else {
                  return const DataErrorWidget();
                } 
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TodoInputField(
              textEditingController: textEditingController,
              onSubmitted: (value) {
                BlocProvider.of<TodoCubit>(context).addNewTodoTask(value);
                textEditingController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
