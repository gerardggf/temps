import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/data/repositories_impl/preferences_repository_impl.dart';
import 'package:temps/generated/translations.g.dart';
import 'package:temps/providers.dart';

final preferencesRepositoryProvider = Provider<PreferencesRepository>(
  (ref) => PreferencesRepositoryImpl(
    ref.watch(sharedPreferencesProvider),
  ),
);

abstract class PreferencesRepository {
  String get temperature;
  Future<bool> setTemperature(String temperature);

  AppLocale? get locale;
  Future<bool> setLocale(AppLocale locale);
}
