import 'package:finance_app/layers/domain/usecases/signUp/sign_up_usecase.dart';
import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_cubit.dart';
import 'package:finance_app/layers/presentation/ui/cubits/signUp/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final AuthenticationCubit _authenticationCubit;
  SignUpCubit(this._signUpUseCase, this._authenticationCubit)
      : super(SignUpInitialState());

  Future<void> signUpButtonPressed({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoadingState());

      await _signUpUseCase(name: name, email: email, password: password);

      _authenticationCubit.loggedIn();

      emit(SignUpSucessfulState());
    } catch (e) {
      emit(SignUpErrorState(errorMessage: "Algo deu errado no SignUp"));
    }
  }
}
