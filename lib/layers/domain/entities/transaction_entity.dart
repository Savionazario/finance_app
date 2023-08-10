import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionEntity {
  String? category;
  DateTime? date;
  String? description;
  String? paymentMethod;
  String? transactionId;
  String? type;
  double? value;

  TransactionEntity({
    this.category,
    this.date,
    this.description,
    this.paymentMethod,
    this.transactionId,
    this.type,
    this.value,
  });
}
