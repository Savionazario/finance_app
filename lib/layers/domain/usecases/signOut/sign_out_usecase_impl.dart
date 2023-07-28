import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  final UserRepository _userRepository;
  SignOutUseCaseImpl(this._userRepository);

  @override
  Future<void> call() async{
    await _userRepository.signOut();
  }
}
