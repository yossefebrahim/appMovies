import 'package:equatable/equatable.dart';

class Failur extends Equatable {
  final String message;

  const Failur(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailur extends Failur {
  const ServerFailur(super.message);
}

class LocalFailur extends Failur {
  const LocalFailur(super.message);
}
