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

  // Implementação do método copyWith
  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
    double? expense,
    double? income,
    List<TransactionEntity>? transactions,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      expense: expense ?? this.expense,
      income: income ?? this.income,
      transactions: transactions ?? this.transactions,
    );
  }
}
