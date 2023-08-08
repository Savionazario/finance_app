import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TransactionDatasource {
  Future<dynamic> createTransaction({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required String value,
  });
}
