import 'package:finance_app/layers/domain/repositories/transaction_repository.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';

import 'create_transaction_usecase.dart';

class CreateTransactionUseCaseImpl implements CreateTransactionUseCase {
  final TransactionRepository _transactionRepository;
  final UserRepository _userRepository;
  CreateTransactionUseCaseImpl(this._transactionRepository, this._userRepository);

  @override
  Future call({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required String value,
  }) async {
    var response = await _transactionRepository.createTransaction(
      category: category,
      date: date,
      description: description,
      paymentMethod: paymentMethod,
      type: type,
      value: double.parse(value),
    );

    await _transactionRepository.updateTotalValues();

    _userRepository.invalidateCachedUser();

    return response;
  }
}
