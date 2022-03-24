import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pockeet/core/data/abstract/firebase_service.dart';
import 'package:pockeet/product/enum/firebase_enum.dart';
import 'package:pockeet/product/models/transaction_model.dart';
import 'package:pockeet/product/models/user_model.dart';

class TransactionManager {
  final FirebaseService service;
  TransactionManager(this.service);

  final String fakeUID = 'EBDcSR3XeRUmTgOPIsOnRrTKgKz1';

  Future<void> register(Person person) async {
    await service.registerWithEmailAndPassword(person);
    await service.loginWithEmailAndPassword(person);
    if (service.auth.currentUser != null) {
      service.saveDataToFirestore(FirebaseEnum.users.name, service.auth.currentUser!.uid, {
        'username': person.email.split('@')[0],
        'totalMoney': 0,
      });
    } else {
      print('CURRENT USER NULL');
    }
  }

  Future<void> login(Person person) async {
    final String? result = await service.loginWithEmailAndPassword(person);
    if (result != null) {
      print(result);
    }
  }

  Future<double> getTotalMoney() async {
    Map<String, dynamic>? result;
    if (service.auth.currentUser != null) {
      result = await service.getDataFromFirebase(
        FirebaseEnum.users.name,
        service.auth.currentUser!.uid,
      );
    } else {
      result = await service.getDataFromFirebase(
        FirebaseEnum.users.name,
        fakeUID,
      );
    }
    return result?['totalMoney'] as double;
  }

  Future<String> getUsername() async {
    Map<String, dynamic>? result;
    if (service.auth.currentUser != null) {
      result = await service.getDataFromFirebase(
        FirebaseEnum.users.name,
        service.auth.currentUser!.uid,
      );
    } else {
      result = await service.getDataFromFirebase(
        FirebaseEnum.users.name,
        fakeUID,
      );
    }
    return '${result?['username']}';
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        await service.getSecondDataFromFirebase(FirebaseEnum.users.name, 'EBDcSR3XeRUmTgOPIsOnRrTKgKz1', FirebaseEnum.transactions.name);
    List<TransactionModel> modelList = [];
    if (service.auth.currentUser != null) {
      String uid = service.auth.currentUser!.uid;
      docs = await service.getSecondDataFromFirebase(FirebaseEnum.users.name, uid, FirebaseEnum.transactions.name);
    }
    for (var doc in docs) {
      TransactionModel newModel = TransactionModel.fromJson(doc.data());
      modelList.add(newModel);
    }

    return modelList;
  }
}
