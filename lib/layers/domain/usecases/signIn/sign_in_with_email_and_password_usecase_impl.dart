import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';


import '../../repositories/firebase_repository.dart';

class SignInWithEmailAndPasswordUseCaseImpl implements SignInWithEmailAndPasswordUseCase{
  final FirebaseRepository _firebaseRepository;
  SignInWithEmailAndPasswordUseCaseImpl(this._firebaseRepository);

  @override
  Future<UserEntity> call({required String email, required String password}) async {
    return await _firebaseRepository.signInUserWithEmailAndPassword(email: email, password: password);
  }
}