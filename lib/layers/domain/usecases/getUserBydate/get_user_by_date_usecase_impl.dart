import 'package:finance_app/layers/domain/entities/transaction_entity.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:finance_app/layers/domain/usecases/getUserBydate/get_user_by_date_usecase.dart';

class GetUserByDateUseCaseImpl implements GetUserByDateUseCase {
  final UserRepository _userRepository;
  GetUserByDateUseCaseImpl(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> call({required DateTime date}) async {
    try {
      var user = await _userRepository.getUpdatedUser();

      List<TransactionEntity> transactionsList =
          user.transactions!.where((transaction) {
        DateTime transactionDate = transaction.date!;
        DateTime searchDate = date;

        return transactionDate.day == searchDate.day &&
            transactionDate.month == searchDate.month || transactionDate.day == searchDate.day - 1 && transactionDate.month == searchDate.month || transactionDate.day == searchDate.day - 2 && transactionDate.month == searchDate.month;
      }).toList();

      print("Lista filtrada: $transactionsList");

      return Right(user.copyWith(transactions: transactionsList));
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
