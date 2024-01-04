import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/generated/translations.g.dart';

import 'state/settings_state.dart';

final settingControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
  (ref) => SettingsController(SettingsState()),
);

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController(
    super.state,
  );

  void updateFetching(bool value) => state = state.copyWith(fetching: value);

  void updateIsFahrenheit(bool value) =>
      state = state.copyWith(isFarenheit: value);

  void updateLocale(AppLocale value) => state = state.copyWith(locale: value);
}
