import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  final FirebaseRepository _firebaseRepository;
  SignOutUseCaseImpl(this._firebaseRepository);

  @override
  Future<void> call() async{
    await _firebaseRepository.signOut();
  }
}
