import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../generated/translations.g.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    @Default(false) bool fetching,
    @Default(false) bool isFarenheit,
    @Default(AppLocale.en) AppLocale locale,
  }) = _SettingsState;
}
