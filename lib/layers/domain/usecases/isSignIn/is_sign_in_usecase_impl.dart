import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase.dart';

class IsSignInUseCaseImpl implements IsSignInUseCase {
  final UserRepository _userRepository;
  IsSignInUseCaseImpl(this._userRepository);

  @override
  bool call() {
    return _userRepository.isSignIn();
  }
}
