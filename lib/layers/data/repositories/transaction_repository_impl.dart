import 'package:finance_app/layers/data/datasources/transaction_datasource.dart';
import 'package:finance_app/layers/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDatasource _transactionDatasource;
  TransactionRepositoryImpl(this._transactionDatasource);

  @override
  Future createTransaction({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required String value,
  }) async {
    return await _transactionDatasource.createTransaction(
      category: category,
      date: date,
      description: description,
      paymentMethod: paymentMethod,
      type: type,
      value: value,
    );
  }
}
