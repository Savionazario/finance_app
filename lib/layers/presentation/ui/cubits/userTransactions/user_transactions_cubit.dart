import 'package:finance_app/layers/domain/usecases/getUserWithFiltered_transactions/get_user_with_filtered_transactions_usecase.dart';
import 'package:finance_app/layers/presentation/ui/cubits/userTransactions/user_transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTransactionsCubit extends Cubit<UserTransactionsState> {
  GetUserWithFilteredTransactionsUsecase
      _getUserWithFilteredTransactionsUsecase;
  UserTransactionsCubit(this._getUserWithFilteredTransactionsUsecase)
      : super(UserTransactionsInitialState());

  void loadUserWithFilteredTransactions({String? searchText}) async {
    emit(UserTransactionsLoadingState());

    var result =
        await _getUserWithFilteredTransactionsUsecase(searchText: searchText);

    result.fold(
      (failure) {
        emit(UserTransactionsErrorState(errorMessage: failure.errorMessage));
      },
      (userEntity) {
        emit(UserTransactionsLoadedState(userEntity: userEntity));
      },
    );
  }
}
