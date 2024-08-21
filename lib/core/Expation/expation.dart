import 'package:cleanarcitecturemmoveapp/core/network/error_message.dart';

class ServerExpation implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExpation({required this.errorMessageModel});
}
