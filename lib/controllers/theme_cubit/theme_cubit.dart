import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_tomorrow/models/theme_model.dart';
import 'package:no_tomorrow/services/theme_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeService _themeService = ThemeService();
  ThemeCubit() : super(const ThemeState());
  Future<void> getCurrentTheme() async {
   ThemeModel result = await _themeService.getCurrentTheme();
    emit(state.copyWith(isDarkMode: result.isDarkMode, themeLoaded: true));
  }

  Future<void> changeCurrentTheme(bool isDarkMode) async {
    ThemeModel result = await _themeService.changeCurrentTheme(isDarkMode);
    emit(state.copyWith(isDarkMode: result.isDarkMode));
  }
}
