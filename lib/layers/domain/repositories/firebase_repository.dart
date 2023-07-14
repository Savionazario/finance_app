import '../entities/user_entity.dart';

abstract class FirebaseRepository {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserEntity> createUserWithEmailAndPassword({required String name, required String email, required String password});

  Future<UserEntity> signInUserWithEmailAndPassword({required String email, required String password});

  Future<dynamic> signOut();

  bool isSignIn();
}