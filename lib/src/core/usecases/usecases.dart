import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/src/core/errors/failure.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
