import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/data/abstract/firebase_service.dart';
import '../enum/firebase_enum.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';

class TransactionManager {
  final FirebaseService service;
  TransactionManager(this.service);

  final String fakeUID = 'EBDcSR3XeRUmTgOPIsOnRrTKgKz1';

  Future<List<TransactionModel>> getAllTransaction() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
        await service.getSecondDataFromFirebase(FirebaseEnum.users.name, fakeUID, FirebaseEnum.transactions.name);
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

  Future<List<TransactionModel>> getAllTransactionByIncome(bool isIncome) async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = await service.getDataFromFirebaseByValue<bool>(
        FirebaseEnum.users.name, 'EBDcSR3XeRUmTgOPIsOnRrTKgKz1', FirebaseEnum.transactions.name, FirebaseEnum.isIncome.name, isIncome);
    List<TransactionModel> modelList = [];
    if (service.auth.currentUser != null) {
      String uid = service.auth.currentUser!.uid;
      docs = await service.getDataFromFirebaseByValue<bool>(
          FirebaseEnum.users.name, uid, FirebaseEnum.transactions.name, FirebaseEnum.isIncome.name, isIncome);
    }
    for (var doc in docs) {
      TransactionModel newModel = TransactionModel.fromJson(doc.data());
      modelList.add(newModel);
    }
    modelList.sort((a, b) => (b.date ?? Timestamp.now()).compareTo(a.date ?? Timestamp.now()));
    return modelList;
  }

  Future<void> register(Person person) async {
    await service.registerWithEmailAndPassword(person);
    await service.loginWithEmailAndPassword(person);
    if (service.auth.currentUser != null) {
      service.saveDataToFirestore(FirebaseEnum.users.name, service.auth.currentUser!.uid, {
        'username': person.email.split('@')[0],
        'money': 0.0,
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

  Future<void> logout() async {
    await service.auth.signOut();
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
    return result?['money'] as double;
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

  Future<void> addTransaction(TransactionModel model) async {
    if (service.auth.currentUser != null) {
      await service.saveDataToSecondFirestore(FirebaseEnum.users.name, service.auth.currentUser!.uid, FirebaseEnum.transactions.name, model.toJson());
    }
  }

  Future<void> setTotalMoney(double money) async {
    if (service.auth.currentUser != null) {
      await service.updateDataToFirestore(FirebaseEnum.users.name, service.auth.currentUser!.uid, {
        'money': money,
      });
    }
  }
}
