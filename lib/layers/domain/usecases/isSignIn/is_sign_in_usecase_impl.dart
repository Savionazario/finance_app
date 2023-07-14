import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase.dart';

class IsSignInUseCaseImpl implements IsSignInUseCase {
  final FirebaseRepository _firebaseRepository;
  IsSignInUseCaseImpl(this._firebaseRepository);

  @override
  bool call() {
    return _firebaseRepository.isSignIn();
  }
}
