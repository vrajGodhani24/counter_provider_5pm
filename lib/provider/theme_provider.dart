import 'package:adv_flutter_5pm/model/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Theme theme = Theme(isDark: false);

  void changeTheme() {
    theme.isDark = !theme.isDark;
    notifyListeners();
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    theme.isDark = sharedPreferences.getBool('isDark') ?? false;

    notifyListeners();
  }
}
