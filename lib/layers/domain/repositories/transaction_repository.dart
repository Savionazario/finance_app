abstract class TransactionRepository {
  Future<dynamic> createTransaction({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required String value,
  });
}
