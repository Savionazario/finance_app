import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class SignUpUseCase {
  Future<UserEntity> call({
    required String name,
    required String email,
    required String password,
  });
}
