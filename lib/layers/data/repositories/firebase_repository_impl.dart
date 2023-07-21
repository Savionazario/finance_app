import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/data/dto/user_dto.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final UserDataSource _firebaseDataSource;
  // late final User? _firebaseUser;
  // var userDto;
  var userId;
  FirebaseRepositoryImpl(this._firebaseDataSource,){
    userId = _firebaseDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      userId = await _firebaseDataSource.createUserWithEmailAndPassword(name: name, email: email, password: password);
      return Right(unit);
    } catch (e) {
      return Left(Failure(errorMessage: 'Erro ao criar conta, tente novamente.'));
    }
    
  }

  @override
  getFirebaseInstance() {
    // TODO: implement getFirebaseInstance
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      userId = await _firebaseDataSource.signInUserWithEmailAndPassword(email: email, password: password);
      return Right(unit);
    }on FirebaseAuthException catch (e) {
      // throw Exception("Algo deu errado em signInUser no repository: $e");
      if (e.code == 'user-not-found') {
        return Left(Failure(errorMessage: 'Nenhum usuário encontrado para este endereço de e-mail.'));
        // print('Nenhum usuário encontrado para este endereço de e-mail.');
      } else if (e.code == 'wrong-password') {
        return Left(Failure(errorMessage: 'Senha incorreta, tente novamente.'));
        // print('Senha incorreta fornecida para este usuário.');
      } else {
        return Left(Failure(errorMessage: 'Erro ao fazer login, tente novamente'));
        // print('Erro ao fazer login: ${e.message}');
      }
    } 
  }

  @override
  Future signOut() async {
    await _firebaseDataSource.signOut();
  }
  
  @override
  bool isSignIn() {
    return _firebaseDataSource.isUserSignIn();
    // if(_firebaseUser == null){
    //   return false;
    // }
    // return true;
  }

  @override
  Future<UserDto> getUpdatedUser() async{
    try {
      UserDto user = await _firebaseDataSource.getUpdatedUser(userId);
      return user;
    } catch (e) {
      throw Exception("Algo deu errado em getUserData no repository: $e");
    }
  }
}
