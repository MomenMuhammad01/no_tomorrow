import 'package:hive_flutter/hive_flutter.dart';
part 'theme_model.g.dart';

@HiveType(typeId: 1)
class ThemeModel extends HiveObject{
  
  @HiveField(0)
  final bool isDarkMode;

  ThemeModel({required this.isDarkMode});
}
