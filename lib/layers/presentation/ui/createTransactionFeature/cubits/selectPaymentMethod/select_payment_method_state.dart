abstract class SelectPaymentMethodState{}

class SelectPaymentMethodInitialState extends SelectPaymentMethodState{
  final String paymentMethod;

  SelectPaymentMethodInitialState({required this.paymentMethod});
}

class SelectedPaymentMethodState extends SelectPaymentMethodState{
  final String paymentMethod;
  final int paymentMethodIndex;

  SelectedPaymentMethodState({required this.paymentMethod, required this.paymentMethodIndex});
}