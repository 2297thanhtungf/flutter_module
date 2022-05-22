
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class NoConnection extends Failure {
  const NoConnection() : super('No connection!');
}

class FireStoreFailure extends Failure {
  final String mess;

  const FireStoreFailure({required this.mess}) : super(mess);
}
