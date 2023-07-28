import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'theme_model.g.dart';
@HiveType(typeId: 1)
class ThemeModel extends Equatable{
  @HiveField(0)
  final bool isDarkMode;
  const ThemeModel({required this.isDarkMode});
  
  @override
  List<Object?> get props => [isDarkMode];

}
