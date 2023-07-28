import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_tomorrow/controllers/theme_cubit/theme_cubit.dart';
import 'package:no_tomorrow/utils/app_constants.dart';
import 'package:no_tomorrow/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Brightness brightness;

  @override
  void didChangeDependencies() {
    brightness = MediaQuery.of(context).platformBrightness;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) {
        if(state.themeLoaded){
          Navigator.popAndPushNamed(context, homeRoute);
        }
      },
      child: Scaffold(
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.white,
        body: Center(
          child: Image.asset(brightness == Brightness.dark ? AssetsManager.darkLogo : AssetsManager.lightLogo),
        ),
      ),
    );
  }
}
