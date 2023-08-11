import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, Unit>> call({
    required String name,
    required String email,
    required String password,
  });
}
