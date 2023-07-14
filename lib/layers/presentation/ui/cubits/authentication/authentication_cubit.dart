import 'package:finance_app/layers/presentation/ui/cubits/authentication/authentication_state.dart';
import 'package:finance_app/layers/presentation/ui/cubits/login/login_cubit.dart';
import 'package:finance_app/layers/domain/usecases/isSignIn/is_sign_in_usecase.dart';
import 'package:finance_app/layers/domain/usecases/signOut/sign_out_usecase.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final IsSignInUseCase _isSignInUseCase;
  final SignOutUseCase _signOutUseCase;
  AuthenticationCubit(
    this._isSignInUseCase,
    this._signOutUseCase,
  ) : super(AuthenticationLoadingState());

  void appStarted() async {
    try {
      var isSignIn = _isSignInUseCase();

      if (isSignIn == true) {
        emit(AuthenticationSuccessfulState());
      } else {
        emit(AuthenticationErrorState());
      }
    } catch (e) {
      emit(AuthenticationErrorState());
    }
  }

  void loggedIn(){
    try {
      emit(AuthenticationSuccessfulState());
    } catch (e) {
      emit(AuthenticationErrorState());
    }
  }

  void signOut() async {
    try {
      await _signOutUseCase();
      emit(AuthenticationErrorState());
    } catch (e) {
      print("Algo deu errado: $e");
      emit(AuthenticationSuccessfulState());
    }
    // await _authService.signOut();

    // emit(AuthenticationErrorState());
  }

  // void appStarted() async{
  //   Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       final FirebaseAuth _auth = _authService.getFirebaseInstance();
  //       _auth.authStateChanges().listen(
  //         (user) {
  //           print("ALGO MUDOU!!!!!!");
  //           if (user != null) {
  //             emit(AuthenticationSuccessfulState());
  //           } else {
  //             emit(AuthenticationErrorState());
  //           }
  //         },
  //       );
  //     },
  //   );
  // }

  // void signOut() async{
  //   await _authService.signOut();

  //   emit(AuthenticationErrorState());
  // }
}
