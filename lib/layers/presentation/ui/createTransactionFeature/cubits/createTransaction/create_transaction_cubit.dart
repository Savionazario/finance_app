import 'package:finance_app/layers/domain/usecases/createTransaction/create_transaction_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_transaction_state.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState>{
  final CreateTransactionUseCase _createTransactionUseCase;
  CreateTransactionCubit(this._createTransactionUseCase) : super(CreateTransactionInitialState());

  void createTransactionButtonPressed({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required String value,
  }) async {
    try {
      emit(CreateTransactionLoadingState());

      var result = await _createTransactionUseCase(category: category, date: date, description: description, paymentMethod: paymentMethod, type: type, value: value,);

      emit(CreateTransactionSucessfulState());
    } catch (e) {
      emit(CreateTransactionErrorState(errorMessage: e.toString()));
    }
  }

}