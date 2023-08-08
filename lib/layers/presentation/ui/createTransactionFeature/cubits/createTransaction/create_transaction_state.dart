abstract class CreateTransactionState{}

class CreateTransactionInitialState extends CreateTransactionState{}

class CreateTransactionLoadingState extends CreateTransactionState{}

class CreateTransactionSucessfulState extends CreateTransactionState{}

class CreateTransactionErrorState extends CreateTransactionState{
  final String errorMessage;

  CreateTransactionErrorState({required this.errorMessage});
}