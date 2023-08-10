import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:finance_app/layers/data/datasources/transaction_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseTransactionDataSourceImpl implements TransactionDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Future<dynamic> createTransaction({
    required String category,
    required DateTime date,
    required String description,
    required String paymentMethod,
    required String type,
    required double value,
  }) async {
    Timestamp dateTimeStamp = Timestamp.fromDate(date);

    var userUid = _auth.currentUser!.uid;
    var newTransactionDocument = await _firestore.collection("users").doc(userUid).collection("transactions").doc();

    var newTransactionDocumentId = newTransactionDocument.id;
    
    Map<String, dynamic> transactionData = {
      "category": category,
      "date": dateTimeStamp,
      "description": description,
      "paymentMethod": paymentMethod,
      "transactionId": newTransactionDocumentId,
      "type": type,
      "value": value,
    };

    await newTransactionDocument.set(transactionData);
  }
  
  @override
  Future<dynamic> updateTotalValues() async{
    var userUid = _auth.currentUser!.uid;
    QuerySnapshot querySnapshot = await _firestore.collection("users").doc(userUid).collection("transactions").get();

    double totalIncome = 0.0;
    double totalExpense = 0.0;

    querySnapshot.docs.forEach((transaction) {
      var transactionAsMap = transaction.data() as Map<String, dynamic>;
      if(transactionAsMap["type"] == "income"){
        totalIncome += transactionAsMap["value"];
      }else{
        totalExpense += transactionAsMap["value"];
      }
    });

    await _firestore.collection("users").doc(userUid).update({"income": totalIncome, "expense": totalExpense,});
  }
}
