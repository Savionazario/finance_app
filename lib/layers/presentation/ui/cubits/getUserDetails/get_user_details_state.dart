import 'package:finance_app/layers/domain/entities/user_entity.dart';

abstract class GetUserDetailsState{}

class GetUserDetailsInitialState extends GetUserDetailsState{}

class GetUserDetailsLoadingState extends GetUserDetailsState{}

class GetUserDetailsSucessfulState extends GetUserDetailsState{
  final UserEntity userEntity;

  GetUserDetailsSucessfulState({required this.userEntity});
}

class GetUserDetailsErrorState extends GetUserDetailsState{
  final String errorMessage;

  GetUserDetailsErrorState({required this.errorMessage});
}