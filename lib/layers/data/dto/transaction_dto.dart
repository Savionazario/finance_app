import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/layers/domain/entities/transaction_entity.dart';

class TransactionDto extends TransactionEntity{
  String? category;
  Timestamp? date;
  String? description;
  String? paymentMethod;
  String? transactionId;
  String? type;
  double? value;

  TransactionDto(
      {this.category,
      this.date,
      this.description,
      this.paymentMethod,
      this.transactionId,
      this.type,
      this.value});

  factory TransactionDto.fromJson(Map<String, dynamic> json) {
    return TransactionDto(
      category: json['category'],
      date: json['date'],
      description: json['description'],
      paymentMethod: json['paymentMethod'],
      transactionId: json['transactionId'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['date'] = this.date;
    data['description'] = this.description;
    data['paymentMethod'] = this.paymentMethod;
    data['transactionId'] = this.transactionId;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}