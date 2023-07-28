
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_tomorrow/models/theme_model.dart';
import 'package:no_tomorrow/utils/app_constants.dart';

class ThemeService{

  final Box<ThemeModel> hiveTheme = Hive.box(themeDataBaseName);
  
  Future<ThemeModel> getCurrentTheme() async {
    if (hiveTheme.containsKey(themeDataBaseKey)) {
      final ThemeModel theme = hiveTheme.get(themeDataBaseKey)!;
      return theme;
    } else {
      hiveTheme.put(themeDataBaseKey, ThemeModel(isDarkMode: false));
      final ThemeModel theme = hiveTheme.get(themeDataBaseKey)!;
      return theme;
    }
  }

  Future<ThemeModel> changeCurrentTheme(bool isDarkMode) async {
    await hiveTheme.put(themeDataBaseKey, ThemeModel(isDarkMode: isDarkMode));
    return ThemeModel(isDarkMode: hiveTheme.get(themeDataBaseKey)!.isDarkMode);
  }

}
