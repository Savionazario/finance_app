import 'package:finance_app/cubits/login/login_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  final AuthService _authService;
  LoginCubit(this._authService) : super(LoginInitialState());

  Future<void> signIn({required String email, required String password}) async{
    try {
      emit(LoginLoadingState());

      await _authService.signInUserWithEmailAndPassword(email: email, password: password);
      
      emit(LoginInitialState());

      // final FirebaseAuth _auth = _authService.getFirebaseInstance();

      // _auth.authStateChanges().listen((user) {
      //   if(user == null){
      //     emit(LoginErrorState(errorMessage: ""));
      //   }else{
      //    emit(LoginSucessfulState()); 
      //   }
      // },);
      

      
    }on FirebaseAuthException catch (e) {
      var errorMessage;
      // if(errorMessage != "Sucess"){
      //   print("Erro: ${errorMessage}");
      // }
      print("Erro: ${e.message}");
      if (e.code == 'user-not-found') {
        errorMessage = 'Nenhum usuário encontrado para este endereço de e-mail.';
        // print('Nenhum usuário encontrado para este endereço de e-mail.');
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha incorreta, tente novamente.';
        // print('Senha incorreta fornecida para este usuário.');
      } else {
        errorMessage = 'Erro ao fazer login: ${e.message}';
        // print('Erro ao fazer login: ${e.message}');
      }
      
      emit(LoginErrorState(errorMessage: errorMessage));
    }
    
  }

  // Future<void> signOut() async{
  //   try {
  //     emit(LoginLoadingState());

  //     _authService.signOut();

  //     // emit(LoginSucessfulState());
  //   } catch (e) {
  //     emit(LoginErrorState(errorMessage: "Deu foi errado"));
  //   }
    
  // }
}