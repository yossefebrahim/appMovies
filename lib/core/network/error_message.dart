import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;
  final bool success;
  final int statecode;

  const ErrorMessageModel({
    required this.errorMessage,
    required this.success,
    required this.statecode,
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        errorMessage: json["status_message"],
        success: json["success"],
        statecode: json["status_code"],
      );

  @override
  List<Object?> get props => [
        statecode,
        errorMessage,
        success,
      ];
}
