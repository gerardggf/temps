import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/home_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(HomeState()),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(
    super.state,
  );

  void updateFetching(bool value) => state = state.copyWith(fetching: value);

  void updateIsFahrenheit(bool value) =>
      state = state.copyWith(isFarenheit: value);

  void updateSearchBarText(String? value) =>
      state = state.copyWith(searchBarText: value?.trim().toLowerCase());
}
