import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, Unit>> call({
    required String name,
    required String email,
    required String password,
  });
}
