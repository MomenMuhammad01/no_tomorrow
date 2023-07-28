import 'package:flutter/material.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';
class TodoInputField extends StatelessWidget {
  const TodoInputField({
    super.key,
    required this.textEditingController,
    required this.onSubmitted,
  });
  final ValueChanged<String>? onSubmitted;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        onSubmitted: onSubmitted,
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: StringsManager.addTodoInputField,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
    );
  }
}
