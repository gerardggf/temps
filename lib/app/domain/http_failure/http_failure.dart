import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_failure.freezed.dart';

@freezed
class HttpFailure with _$HttpFailure {
  factory HttpFailure.noPosition() = NoPositionError;
  factory HttpFailure.network() = NetworkError;
  factory HttpFailure.connection() = ConnectionError;
}
