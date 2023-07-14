import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class SignInWithEmailAndPasswordUseCase{
  Future<UserEntity> call({required String email, required String password});
}