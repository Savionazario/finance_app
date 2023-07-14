import 'package:finance_app/layers/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final double? expense;
  final double? income;

  UserDto({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.expense,
    required this.income,
  }) : super(
          name: name,
          email: email,
          password: password,
          uid: uid,
          expense: double.parse(expense.toString()),
          income: double.parse(income.toString()),
        );

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      uid: json['uid'],
      expense: double.parse(json['expense'].toString()),
      income: double.parse(json['income'].toString())
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
    return data;
  }
}
