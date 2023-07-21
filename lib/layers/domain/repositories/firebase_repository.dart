import 'package:dartz/dartz.dart';
import 'package:finance_app/core/errors/failure.dart';

import '../entities/user_entity.dart';

abstract class FirebaseRepository {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<Failure, Unit>> createUserWithEmailAndPassword({required String name, required String email, required String password});

  Future<Either<Failure, Unit>> signInUserWithEmailAndPassword({required String email, required String password});

  Future<dynamic> signOut();

  Future<UserEntity> getUpdatedUser();

  bool isSignIn();
}