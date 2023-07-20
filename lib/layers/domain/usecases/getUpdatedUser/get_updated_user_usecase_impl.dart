import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/usecases/getUpdatedUser/get_updated_user_usecase.dart';

import '../../repositories/firebase_repository.dart';

class getUpdatedUserUsecaseImpl implements getUpdatedUserUsecase{
  final FirebaseRepository _firebaseRepository;
  getUpdatedUserUsecaseImpl(this._firebaseRepository);

  @override
  Future<UserEntity> call() async{
    return await _firebaseRepository.getUpdatedUser(); 
  }

}