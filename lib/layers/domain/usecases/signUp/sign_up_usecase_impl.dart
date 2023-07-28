import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase.dart';

import '../../../../core/errors/failure.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final UserRepository _userRepository;
  SignUpUseCaseImpl(this._userRepository);

  @override
  Future<Either<Failure, Unit>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _userRepository.createUserWithEmailAndPassword(name: name, email: email, password: password);
  }
}
