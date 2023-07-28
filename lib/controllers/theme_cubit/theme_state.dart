part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  final bool themeLoaded;
  const ThemeState({
    this.isDarkMode = false, 
    this.themeLoaded = false,
    });

  @override
  List<Object> get props => [isDarkMode];

  ThemeState copyWith({
    bool? isDarkMode,
    bool? themeLoaded,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      themeLoaded: themeLoaded ?? this.themeLoaded,
    );
  }
}
