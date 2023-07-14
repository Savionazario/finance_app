abstract class SignUpState{}

class SignUpInitialState extends SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpSucessfulState extends SignUpState{}

class SignUpErrorState extends SignUpState{
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}