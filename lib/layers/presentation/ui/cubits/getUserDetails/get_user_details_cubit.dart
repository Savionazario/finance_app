import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/usecases/getUpdatedUser/get_updated_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState>{
  final getUpdatedUserUsecase _getUpdatedUserUsecase;
  GetUserDetailsCubit(this._getUpdatedUserUsecase) : super(GetUserDetailsInitialState());

  void loadUserDetails() async{
    try {
      emit(GetUserDetailsLoadingState());

      UserEntity user = await _getUpdatedUserUsecase();

      emit(GetUserDetailsSucessfulState(userEntity: user));
    } catch (e) {
      emit(GetUserDetailsErrorState(errorMessage: e.toString()));
    }
  }

}