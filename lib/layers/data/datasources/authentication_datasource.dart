import 'package:finance_app/layers/data/dto/user_dto.dart';

abstract class AuthenticationDataSource {
  Future<String> createUserWithEmailAndPassword({required String name, required String email, required String password,});

  Future<String> signInUserWithEmailAndPassword({required String email, required String password,});

  Future<dynamic> signOut();

  Future<UserDto> getUpdatedUser(String userUid);

  bool isUserSignIn();

  String? getCurrentUser();
}