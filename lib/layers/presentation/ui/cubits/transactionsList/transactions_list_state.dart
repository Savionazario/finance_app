import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class TransactionListState{}

class TransactionListInitialState extends TransactionListState{}

class TransactionListLoadingState extends TransactionListState{}

class TransactionListLoadedState extends TransactionListState{
  final UserEntity userEntity;

  TransactionListLoadedState({required this.userEntity});
}

class TransactionListErrorState extends TransactionListState{
  final String errorMessage;

  TransactionListErrorState({required this.errorMessage});
}
