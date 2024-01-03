import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/providers.dart';

final internetCheckerProvider = Provider<InternetChecker>(
  (ref) => InternetChecker(
    ref.watch(dioProvider),
  ),
);

class InternetChecker {
  final Dio dio;

  InternetChecker(this.dio);

  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        final response = await dio.get('8.8.8.8');
        return response.statusCode == 200;
      } else {
        final list = await InternetAddress.lookup('google.com');
        return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
