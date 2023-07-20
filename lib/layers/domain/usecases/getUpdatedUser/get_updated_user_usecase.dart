import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class getUpdatedUserUsecase{
  Future<UserEntity> call();
}