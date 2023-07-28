import 'package:finance_app/layers/domain/usecases/getUserBydate/get_user_by_date_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  final GetUserByDateUseCase _getUserByDateUseCase;
  GetUserDetailsCubit(this._getUserByDateUseCase)
      : super(GetUserDetailsInitialState());

  void loadUserDetails({required DateTime date}) async {
    try {
      emit(GetUserDetailsLoadingState());

      var result = await _getUserByDateUseCase(date: date);

      result.fold(
        (failure) {
          emit(GetUserDetailsErrorState(errorMessage: failure.errorMessage));
        },
        (user) {
          emit(GetUserDetailsSucessfulState(userEntity: user));
        },
      );

      // emit(GetUserDetailsSucessfulState(userEntity: user));
    } catch (e) {
      emit(GetUserDetailsErrorState(errorMessage: e.toString()));
    }
  }
}
