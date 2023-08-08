import 'package:finance_app/layers/presentation/ui/createTransactionFeature/cubits/selectPaymentMethod/select_payment_method_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPaymentMethodCubit extends Cubit<SelectPaymentMethodState>{
  SelectPaymentMethodCubit() : super(SelectPaymentMethodInitialState(paymentMethod: "Cartão de débito"));

  void selectPaymentMethod({required String paymentMethod, required paymentMethodIndex}){
    emit(SelectedPaymentMethodState(paymentMethod: paymentMethod, paymentMethodIndex: paymentMethodIndex));
  }
}