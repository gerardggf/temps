import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/providers.dart';

import '../../data/repositories_impl/connectivity_repository_impl.dart';
import '../../data/services/remote/internet_checker.dart';

final connectivityRepositoryProvider = Provider<ConnectivityRepository>(
  (ref) => ConnectivityRepositoryImpl(
    ref.watch(connectivityProvider),
    ref.watch(internetCheckerProvider),
  ),
);

abstract class ConnectivityRepository {
  Future<void> initialize();
  bool get hasInternet;
  Stream<bool> get onInternetChanged;
}
