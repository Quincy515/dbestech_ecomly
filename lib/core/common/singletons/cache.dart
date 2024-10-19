import 'package:flutter/material.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  String? _sessionToke;
  String? _userId;
  final themeModeNotifier = ValueNotifier(ThemeMode.system);

  String? get sessionToken => _sessionToke;
  String? get userId => _userId;

  void setSessionToken(String? newToken) {
    if (_sessionToke != newToken) _sessionToke = newToken;
  }

  void setUserId(String? newUserId) {
    if (_userId != newUserId) _userId = newUserId;
  }

  void setThemeMode(ThemeMode newThemeMode) {
    if (themeModeNotifier.value != newThemeMode) {
      themeModeNotifier.value = newThemeMode;
    }
  }

  void resetSession() {
    setSessionToken(null);
    setUserId(null);
  }
}
