import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';


class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 150.ms)],
      child: Column(
        children: [
          const SizedBox(height: 120),
          Icon(Icons.error_outline,
              size: 200, color: Theme.of(context).primaryColor),
          Text(
            StringsManager.dataLoadFailed,
            style: TextStyle(color: Theme.of(context).primaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
