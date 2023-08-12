import 'package:finance_app/layers/domain/usecases/getUserBydate/get_user_by_date_usecase.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithRecentTransactions/get_user_with_recent_transactions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  final GetUserByDateUseCase _getUserByDateUseCase;
  final GetUserWithRecentTransactionsUseCase _getUserWithRecentTransactionsUseCase;
  GetUserDetailsCubit(this._getUserByDateUseCase, this._getUserWithRecentTransactionsUseCase)
      : super(GetUserDetailsInitialState());

  void loadUserDetails({required DateTime date}) async {
    try {
      
      emit(GetUserDetailsLoadingState());
      // await Future.delayed(Duration(seconds: 2),(){
      //   print("Passando por aqui");
      // });
      

      // var result = await _getUserByDateUseCase(date: date);
      var result = await _getUserWithRecentTransactionsUseCase();

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
