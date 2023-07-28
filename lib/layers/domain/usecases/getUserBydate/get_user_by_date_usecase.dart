import 'package:dartz/dartz.dart';
import 'package:finance_app/core/errors/failure.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class GetUserByDateUseCase{
  Future<Either<Failure, UserEntity>> call({required DateTime date});
}