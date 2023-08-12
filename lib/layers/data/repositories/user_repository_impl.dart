import 'package:dartz/dartz.dart';
import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthenticationDataSource _authenticationDatasource;
  // late final User? _firebaseUser;
  // var userDto;
  var userId;
  var cachedUser;
  UserRepositoryImpl(this._authenticationDatasource,){
    userId = _authenticationDatasource.getCurrentUser();
  }

  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      userId = await _authenticationDatasource.createUserWithEmailAndPassword(name: name, email: email, password: password);
      return Right(unit);
    } catch (e) {
      return Left(Failure(errorMessage: 'Erro ao criar conta, tente novamente.'));
    }
    
  }

  @override
  Future<Either<Failure, Unit>> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      userId = await _authenticationDatasource.signInUserWithEmailAndPassword(email: email, password: password);
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
    await _authenticationDatasource.signOut();
    invalidateCachedUser();
  }
  
  @override
  bool isSignIn() {
    return _authenticationDatasource.isUserSignIn();
    // if(_firebaseUser == null){
    //   return false;
    // }
    // return true;
  }

  @override
  Future<UserEntity> getUpdatedUser() async{
    try {
      if (cachedUser != null) {
        return cachedUser!;
      }
      UserEntity user = await _authenticationDatasource.getUpdatedUser(userId);
      cachedUser = user;
      return user;
    } catch (e) {
      throw Exception("Algo deu errado em getUserData no userRepository: $e");
      // return Left(Failure(errorMessage: "Algo deu errado em getUserData no repository: $e"));
    }
  }

  @override
  void invalidateCachedUser() {
    cachedUser = null;
  }
}
