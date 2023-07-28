import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';

class NoTodoFound extends StatelessWidget {
  const NoTodoFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 150.ms)],
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_task, size: 200, color: Theme.of(context).primaryColor,),
            Text(
              StringsManager.noTodoFound,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
      ),
    );
  }
}
