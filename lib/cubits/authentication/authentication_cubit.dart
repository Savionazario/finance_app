import 'package:finance_app/cubits/authentication/authentication_state.dart';
import 'package:finance_app/cubits/login/login_cubit.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthService _authService;
  AuthenticationCubit(this._authService) : super(AuthenticationLoadingState());

  void appStarted() async{
    Future.delayed(
      Duration(seconds: 2),
      () {
        final FirebaseAuth _auth = _authService.getFirebaseInstance();
        _auth.authStateChanges().listen(
          (user) {
            print("ALGO MUDOU!!!!!!");
            if (user != null) {
              emit(AuthenticationSuccessfulState());
            } else {
              emit(AuthenticationErrorState());
            }
          },
        );
      },
    );
  }

  void signOut() async{
    await _authService.signOut();

    emit(AuthenticationErrorState());
  }
}
