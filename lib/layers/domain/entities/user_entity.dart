import 'package:finance_app/layers/domain/entities/transaction_entity.dart';

class UserEntity {
  String? uid;
  String? name;
  String? email;
  String? password;
  double? expense;
  double? income;
  List<TransactionEntity>? transactions;

  UserEntity({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.expense,
    this.income,
    this.transactions,
  });
}
