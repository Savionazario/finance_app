import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final FirebaseRepository _firebaseRepository;
  SignUpUseCaseImpl(this._firebaseRepository);

  @override
  Future<UserEntity> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _firebaseRepository.createUserWithEmailAndPassword(name: name, email: email, password: password);
  }
}
