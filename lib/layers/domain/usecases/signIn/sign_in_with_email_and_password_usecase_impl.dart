import 'package:dartz/dartz.dart';
import 'package:finance_app/core/errors/failure.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';
import '../../repositories/user_repository.dart';

class SignInWithEmailAndPasswordUseCaseImpl implements SignInWithEmailAndPasswordUseCase{
  final UserRepository _userRepository;
  SignInWithEmailAndPasswordUseCaseImpl(this._userRepository);

  @override
  Future<Either<Failure, Unit>> call({required String email, required String password}) async {
    return await _userRepository.signInUserWithEmailAndPassword(email: email, password: password);
  }
}