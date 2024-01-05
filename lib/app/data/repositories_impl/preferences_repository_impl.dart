import 'package:shared_preferences/shared_preferences.dart';
import 'package:temps/app/const/dropdown_options.dart';
import 'package:temps/app/domain/enums.dart';
import 'package:temps/app/domain/repositories/preferences_repository.dart';
import 'package:temps/generated/translations.g.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> setTemperature(String temperature) async {
    return await sharedPreferences.setString(
        Preferences.temperature.name, temperature);
  }

  @override
  Future<bool> setLocale(AppLocale locale) async {
    return await sharedPreferences.setString(
        Preferences.locale.name, locale.name);
  }

  @override
  AppLocale? get locale {
    final storedLocale = sharedPreferences.getString(Preferences.locale.name);
    if (storedLocale == null) return null;
    return AppLocaleUtils.parse(storedLocale);
  }

  @override
  String get temperature =>
      sharedPreferences.getString(Preferences.temperature.name) ??
      DropdownOptions.temperature.first;
}
