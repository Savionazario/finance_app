import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> createUserWithEmailAndPassword({required String email, required String password}) async{
    try{
      var response = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("Resposta: $response");
    }on FirebaseAuthException catch(e){
      print("Erro: ${e.message}");
      return e.message;
    }
  }

  Future<dynamic> signInUserWithEmailAndPassword({required String email, required String password}) async{

      var response = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Resposta: $response");

      var tokenResult = await response.user?.getIdToken();
      print("-------------------------------\n");
      print("Token: $tokenResult");
      print("-------------------------------\n");
      // return "Sucess";
      return response.user;
  }

  Future<dynamic> signOut() async{
    await _auth.signOut();
  }

  getFirebaseInstance(){
    return _auth;
  }
  
}