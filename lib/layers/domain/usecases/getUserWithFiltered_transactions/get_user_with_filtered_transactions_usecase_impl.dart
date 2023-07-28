import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/usecases/getUserWithFiltered_transactions/get_user_with_filtered_transactions_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/user_repository.dart';

class GetUserWithFilteredTransactionsUsecaseImpl
    implements GetUserWithFilteredTransactionsUsecase {
  final UserRepository _userRepository;
  GetUserWithFilteredTransactionsUsecaseImpl(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> call({String? searchText}) async {
    try {
      var user = await _userRepository.getUpdatedUser();
      if (searchText != null && searchText.isNotEmpty && searchText != "") {
        List<TransactionEntity> transactionsList =
            user.transactions!.where((transaction) {
          return transaction.category!.toLowerCase().contains(searchText) ||
              transaction.description!.toLowerCase().contains(searchText);
        }).toList();

        print("Lista filtrada: $transactionsList");

        return Right(user.copyWith(transactions: transactionsList));
      }

      return Right(user);
    } catch (e) {
      print("O erro é: $e");
      return Left(Failure(errorMessage: "Erro ao Carregar seus dados!"));
    }
  }
}
