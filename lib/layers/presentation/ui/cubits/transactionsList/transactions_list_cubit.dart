import 'package:finance_app/layers/domain/usecases/getUserWithFiltered_transactions/get_user_with_filtered_transactions_usecase.dart';
import 'package:finance_app/layers/presentation/ui/cubits/transactionsList/transactions_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  GetUserWithFilteredTransactionsUsecase
      _getUserWithFilteredTransactionsUsecase;
  TransactionListCubit(this._getUserWithFilteredTransactionsUsecase)
      : super(TransactionListInitialState());

  void loadUserWithFilteredTransactions({String? searchText}) async {
    emit(TransactionListLoadingState());

    var result =
        await _getUserWithFilteredTransactionsUsecase(searchText: searchText);

    result.fold(
      (failure) {
        emit(TransactionListErrorState(errorMessage: failure.errorMessage));
      },
      (userEntity) {
        emit(TransactionListLoadedState(userEntity: userEntity));
      },
    );
  }
}
