import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.permissionDenied(String message) = PermissionDeniedFailure;
  const factory Failure.storage(String message) = StorageFailure;
  const factory Failure.transcription(String message) = TranscriptionFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}
