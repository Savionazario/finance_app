import 'package:finance_app/layers/domain/entities/transaction_entity.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'get_user_with_recent_transactions_usecase.dart';

class GetUserWithRecentTransactionsUseCaseImpl implements GetUserWithRecentTransactionsUseCase {
  final UserRepository _userRepository;
  GetUserWithRecentTransactionsUseCaseImpl(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    try {
      var user = await _userRepository.getUpdatedUser();
      
      if(user.transactions!.length >= 5){
        List<TransactionEntity> transactionsList =
          user.transactions!.sublist(user.transactions!.length - 5, user.transactions!.length);
          return Right(user.copyWith(transactions: transactionsList));
      }
      
      return Right(user);
    } catch (e) {
      print("O erro é: $e");
      return Left(Failure(errorMessage: "Erro ao Carregar seus dados!"));
    }

    // try {
    //   var user = await _userRepository.getUpdatedUser();

    //   user.fold(
    //     (error) {
    //       return Left(error);
    //     },
    //     (sucess) {
    //       List<TransactionEntity> transactionsList =
    //           sucess.transactions!.where((transaction) {
    //         DateTime transactionDate = transaction.date!.toDate();
    //         DateTime searchDate = date;

    //         return transactionDate.day == searchDate.day &&
    //             transactionDate.month == searchDate.month;
    //       }).toList();

    //       return Right(UserEntity(
    //         name: sucess.name,
    //         email: sucess.email,
    //         password: sucess.password,
    //         expense: sucess.expense,
    //         income: sucess.income,
    //         transactions: transactionsList,
    //       ));
    //     },
    //   );
    // } catch (e) {
    //   return Left(Failure(errorMessage: "Erro "));
    // }
    // return Left(Failure(errorMessage: ""));
  }
}
