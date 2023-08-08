abstract class SelectTransactionCategoryState{}

class TransactionCategoryInitialState extends SelectTransactionCategoryState{
  final String category;
  
  TransactionCategoryInitialState({required this.category});
}

class TransactionCategorySelectedState extends SelectTransactionCategoryState{
  final String category;
  final int indexCategory;

  TransactionCategorySelectedState({required this.category, required this.indexCategory,});
}