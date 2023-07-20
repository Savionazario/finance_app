import 'package:finance_app/layers/data/dto/transaction_dto.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';

import '../../domain/entities/transaction_entity.dart';

class UserDto extends UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final double? expense;
  final double? income;
  List<TransactionEntity>? transactions;

  UserDto({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.expense,
    required this.income,
    required this.transactions,
  }) : super(
          name: name,
          email: email,
          password: password,
          uid: uid,
          expense: double.parse(expense.toString()),
          income: double.parse(income.toString()),
          transactions: transactions,
        );

  factory UserDto.fromJson(Map<String, dynamic> json, List jsonTransactions) {
    List<TransactionDto> transactionsList = [];
    if (jsonTransactions.isNotEmpty) {
      jsonTransactions.forEach((v) {
        transactionsList.add(TransactionDto.fromJson(v));
      });
    }
    return UserDto(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      uid: json['uid'],
      expense: double.parse(json['expense'].toString()),
      income: double.parse(json['income'].toString()),
      transactions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['expense'] = this.expense;
    data['income'] = this.income;
    data['transactions'] = this.transactions;
    return data;
  }
}
