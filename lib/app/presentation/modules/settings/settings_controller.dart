import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/domain/repositories/preferences_repository.dart';
import 'package:temps/generated/translations.g.dart';

import 'state/settings_state.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
  (ref) => SettingsController(
    SettingsState(),
    ref.watch(preferencesRepositoryProvider),
  ),
);

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController(
    super.state,
    this.preferencesRepository,
  ) {
    _init();
  }

  void _init() async {
    state = state.copyWith(
      isFarenheit:
          preferencesRepository.temperature == 'Celsius' ? false : true,
    );
    state = state.copyWith(
        locale:
            preferencesRepository.locale ?? LocaleSettings.useDeviceLocale());
  }

  final PreferencesRepository preferencesRepository;

  void updateFetching(bool value) => state = state.copyWith(fetching: value);

  void updateIsFahrenheit(bool value) {
    state = state.copyWith(isFarenheit: value);
    preferencesRepository.setTemperature(value ? 'Fahrenheit' : 'Celsius');
  }

  void updateLocale(AppLocale value) {
    state = state.copyWith(locale: value);
    preferencesRepository.setLocale(value);
    LocaleSettings.setLocale(value);
  }

  void updateSearchBarText(String? value) =>
      state = state.copyWith(searchBarText: value?.trim().toLowerCase());
}
