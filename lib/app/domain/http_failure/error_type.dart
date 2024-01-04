import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_type.freezed.dart';

@freezed
class ErrorType with _$ErrorType {
  factory ErrorType.noPosition() = NoPositionError;
  factory ErrorType.server() = ServerError;
  factory ErrorType.connection() = ConnectionError;
  factory ErrorType.apiKey() = ApiKeyError;
  factory ErrorType.locationNotFound() = LocationNotFoundError;
  factory ErrorType.freePlan() = FreePlanError;
  factory ErrorType.unknown() = UnknownError;
}
