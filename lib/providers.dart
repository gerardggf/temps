import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final connectivityProvider = Provider<Connectivity>(
  (ref) => Connectivity(),
);
