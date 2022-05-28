import '../themes/theme_model.dart';
import '../themes/themes.dart';

enum MultiThemeMode { black, red, blue }

class ThemeController {
  static ThemeModel theme = RedTheme();

  static void change(MultiThemeMode mode) {
    switch (mode) {
      case MultiThemeMode.red:
        theme = RedTheme();
        break;
      default:
    }
  }
}
