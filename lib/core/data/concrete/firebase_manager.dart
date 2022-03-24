import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pockeet/product/models/user_model.dart';

import '../abstract/firebase_service.dart';

class FirebaseManager extends FirebaseService {
  @override
  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName) async {
    final result = await firestore.collection(collectionName).doc(documentName).get();
    final data = result.data();
    return data;
  }

  @override
  Future<String?> loginWithEmailAndPassword(Person person) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: person.email,
        password: person.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Future<String?> registerWithEmailAndPassword(Person person) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: person.email,
        password: person.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSecondDataFromFirebase(
      String collectionName, String documentName, String secondCollectionName) async {
    final result = await firestore.collection(collectionName).doc(documentName).collection(secondCollectionName).get();
    final data = result.docs;
    return data;
  }

  @override
  Future<void> saveDataToFirestore(String collectionName, String documentName, Map<String, dynamic> model) async {
    await firestore.collection(collectionName).doc(documentName).set(model);
  }
}
