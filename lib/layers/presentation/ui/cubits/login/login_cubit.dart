import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_state.dart';
import 'package:finance_app/layers/domain/usecases/signIn/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationCubit _authenticationCubit;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  LoginCubit(this._signInWithEmailAndPasswordUseCase, this._authenticationCubit)
      : super(LoginInitialState());

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());

    var result = await _signInWithEmailAndPasswordUseCase(
        email: email, password: password);

    result.fold(
      (error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      },
      (sucess) {
        _authenticationCubit.loggedIn();
        emit(LoginInitialState());
      },
    );
  }
}
