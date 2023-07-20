import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/layers/data/datasources/authentication_datasource.dart';
import 'package:finance_app/layers/data/dto/user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDataSourceImpl implements UserDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserDto> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    var response = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    var userUid = response.user!.uid;

    await createUserFieldsInFirestore(name: name, email: email, password: password, userUid: userUid);

    var userdata = await _getUserFromCollection(userUid);
    var transactionsList = await _getUserTransactionsFromCollection(userUid);

    UserDto userDto = UserDto.fromJson(userdata.data(), transactionsList);

    return userDto;
  }

  @override
  Future<UserDto> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var response = await _auth.signInWithEmailAndPassword(email: email, password: password);
    var userUid = response.user!.uid;

    var userdata = await _getUserFromCollection(userUid);
    var transactionsList = await _getUserTransactionsFromCollection(userUid);

    UserDto userDto = UserDto.fromJson(userdata.data(), transactionsList);

    return userDto;
  }

  @override
  Future signOut() async{
    await _auth.signOut();
  }

  @override
  User? getCurrentUser() {
    return  _auth.currentUser;
  }

  Future<dynamic> _getUserFromCollection(String userUid) async {
    return await _firestore.collection("users").doc(userUid).get();
  }

  Future<dynamic> _getUserTransactionsFromCollection(String userUid) async {
    QuerySnapshot querySnapshot = await _firestore.collection("users").doc(userUid).collection("transactions").get();

    var transactionsList = querySnapshot.docs.map((doc) => doc.data()).toList();

    return transactionsList;
  }

  Future<dynamic> createUserFieldsInFirestore({required String userUid, required String name, required String email, required String password,}) async {
    Map<String, dynamic> userData = {
      "uid": userUid,
      "name": name,
      "email": email,
      "password": password,
      "expense": 0,
      "income": 0,
    };
    await _firestore.collection("users").doc(userUid).set(userData);
  }
  
  @override
  Future<UserDto> getUpdatedUser(String userUid) async{
    var userdata = await _getUserFromCollection(userUid);
    var transactionsList = await _getUserTransactionsFromCollection(userUid);

    UserDto userDto = UserDto.fromJson(userdata.data(), transactionsList);

    return userDto;
  }

  

}
