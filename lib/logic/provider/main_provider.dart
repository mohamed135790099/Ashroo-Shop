import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MainProvider extends ChangeNotifier{
  var tm = ThemeMode.light;
  String themeMode = "s";

  
  void changeThemeMode(newValue) async {
    tm = newValue;
    setThemeMode(tm);

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs =  _prefs as SharedPreferences;
    prefs.setString("themeMode", themeMode);

    notifyListeners();
  }

  setThemeMode(ThemeMode tm) async {
    if (tm == ThemeMode.system) {
      themeMode = "s";
    } else if (tm == ThemeMode.light) {
      themeMode = "l";
    } else if (tm == ThemeMode.dark) {
      themeMode = "d";
    }

    notifyListeners();
  }

  getThemeMode() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs =  _prefs as SharedPreferences;
    var theme = prefs.getString("themeMode") ?? "s";
    if (theme == "s") {
      tm = ThemeMode.system;
    }
    else if (theme == "l") {
      tm = ThemeMode.light;
    }
    else if (theme == "d")
    {
      tm = ThemeMode.dark;
    }

    notifyListeners();
  }
}

