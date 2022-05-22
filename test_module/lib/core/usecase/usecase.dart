import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_module/core/errors/failed.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
