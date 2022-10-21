import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.grey.shade100,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  accentColor: Colors.lightBlueAccent,
  scaffoldBackgroundColor: Colors.black87,
);

class ThemeSettings with ChangeNotifier {
  bool _darktheme = false;
  SharedPreferences? _preferences;
  bool _doneLoading = false;

  bool get darkTheme => _darktheme;
  bool get doneLoading => _doneLoading;

  set doneLoading(bool value) {
    _doneLoading = value;
    notifyListeners();
  }

  ThemeSettings() {
    _loadSettingsFromPrefs();
  }

  _intializePrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _loadSettingsFromPrefs() async {
    await _intializePrefs();
    _darktheme = _preferences?.getBool('darkTheme') ?? false;

    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _intializePrefs();
    _preferences?.setBool('darkTheme', _darktheme);
  }

  void toggleTheme() {
    _darktheme = !_darktheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
