import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/data/dto/user_dto.dart';
import 'package:finance_app/layers/domain/entities/user_entity.dart';
import 'package:finance_app/layers/domain/repositories/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final AuthenticationDataSource _firebaseDataSource;
  late final User? _firebaseUser;
  var userDto;
  FirebaseRepositoryImpl(this._firebaseDataSource,){
    _firebaseUser = _firebaseDataSource.getCurrentUser();
  }

  @override
  Future<UserEntity> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseDataSource.createUserWithEmailAndPassword(name: name, email: email, password: password);
      return user;
    } catch (e) {
      throw Exception("Algo deu errado em signUpUser no repository!");
    }
    
  }

  @override
  getFirebaseInstance() {
    // TODO: implement getFirebaseInstance
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _firebaseDataSource.signInUserWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (e) {
      // throw Exception("Algo deu errado em signInUser no repository!");
      throw Exception("Algo deu errado em signInUser no repository: $e");
    }
    
  }

  @override
  Future signOut() async {
    await _firebaseDataSource.signOut();
  }
  
  @override
  bool isSignIn() {
    if(_firebaseUser == null){
      return false;
    }
    return true;
  }

  // Future<UserDto> getUserData() async{
  //   try {

  //   } catch (e) {
      
  //   }
  // }
}
