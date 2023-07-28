import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_tomorrow/app.dart';
import 'package:no_tomorrow/bloc_observer.dart';
import 'package:no_tomorrow/models/theme_model.dart';
import 'package:no_tomorrow/models/todo_model.dart';
import 'package:no_tomorrow/utils/app_constants.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  Hive.registerAdapter(ThemeModelAdapter());
  await Hive.openBox<TodoModel>(todoDataBaseName);
  await Hive.openBox<ThemeModel>(themeDataBaseName);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}