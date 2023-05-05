abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginSucessfulState extends LoginState{}

class LoginErrorState extends LoginState{
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}