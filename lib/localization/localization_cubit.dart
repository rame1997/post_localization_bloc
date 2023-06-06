import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../preferences/user_preferences.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<ChangeLocaleState> {
  LocalizationCubit() : super(ChangeLocaleState(locale: Locale('en')));
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
    await SharedPrefController().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await SharedPrefController().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
