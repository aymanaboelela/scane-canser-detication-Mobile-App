import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  static const String _languageCodeKey = 'languageCode';

  void _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(_languageCodeKey);
    if (languageCode != null) {
      emit(Locale(languageCode));
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
    emit(locale);
  }

  Future<void> toggleLanguage() async {
    final currentLanguage = state.languageCode;
    if (currentLanguage == 'en') {
      await changeLanguage(const Locale('ar'));
    } else {
      await changeLanguage(const Locale('en'));
    }
  }

  String get languageName {
    return state.languageCode == 'ar' ? 'العربية' : 'English';
  }
}
