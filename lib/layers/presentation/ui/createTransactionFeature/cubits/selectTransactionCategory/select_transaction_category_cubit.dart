import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectTransactionCategory/select_transaction_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTransactionCategoryCubit extends Cubit<SelectTransactionCategoryState>{
  SelectTransactionCategoryCubit() : super(TransactionCategoryInitialState(category: "Alimentação"));

  void selectCategory({required String category, required int indexCategory,}){
    emit(TransactionCategorySelectedState(category: category, indexCategory: indexCategory));
  }

}