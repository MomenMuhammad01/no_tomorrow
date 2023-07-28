import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_tomorrow/controllers/todo_cubit/todo_cubit.dart';
import 'package:no_tomorrow/utils/app_constants.dart';
import 'package:no_tomorrow/utils/strings_manager.dart';
import 'package:no_tomorrow/utils/theme_manager.dart';
import 'package:no_tomorrow/views/splash_screen.dart';
import 'package:no_tomorrow/views/todo_screen.dart';
import 'controllers/theme_cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit()..getCurrentTheme(),
          ),
          BlocProvider(
            create: (context) => TodoCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: StringsManager.appName,
              theme: state.isDarkMode
                  ? ThemeManger.darkTheme
                  : ThemeManger.lightTheme,
              debugShowCheckedModeBanner: false,
              routes: {
                splashRoute :(context) => const SplashScreen(),
                homeRoute : (context) => const TodoScreen()
              },
              initialRoute: splashRoute,
            );
          },
        ),
      ),
    );
  }
}
