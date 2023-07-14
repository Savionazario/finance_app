import 'package:finance_app/layers/data/dto/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource {
  Future<UserDto> createUserWithEmailAndPassword({required String name, required String email, required String password,});

  Future<UserDto> signInUserWithEmailAndPassword({required String email, required String password,});

  Future<dynamic> signOut();

  User? getCurrentUser();
}