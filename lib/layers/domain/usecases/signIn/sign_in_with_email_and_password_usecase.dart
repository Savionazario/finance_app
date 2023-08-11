import 'package:dartz/dartz.dart';
import 'package:finance_app/core/errors/failure.dart';

abstract class SignInWithEmailAndPasswordUseCase{
  Future<Either<Failure, Unit>> call({required String email, required String password});
}