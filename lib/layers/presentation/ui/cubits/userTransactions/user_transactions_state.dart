import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class UserTransactionsState{}

class UserTransactionsInitialState extends UserTransactionsState{}

class UserTransactionsLoadingState extends UserTransactionsState{}

class UserTransactionsLoadedState extends UserTransactionsState{
  final UserEntity userEntity;

  UserTransactionsLoadedState({required this.userEntity});
}

class UserTransactionsErrorState extends UserTransactionsState{
  final String errorMessage;

  UserTransactionsErrorState({required this.errorMessage});
}
