import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';

class NoTodoToDelete extends StatelessWidget {
  const NoTodoToDelete({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Animate(
        effects: [FadeEffect(duration: 150.ms)],
        child: Column(
            children: [
              const SizedBox(height: 120),
              Icon(Icons.warning_amber_rounded,
                  size: 200, color: Theme.of(context).primaryColor),
              Text(
                StringsManager.noTodoToDelete,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
      ),
    );
  }
}
