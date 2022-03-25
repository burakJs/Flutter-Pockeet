import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../product/models/user_model.dart';

abstract class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSecondDataFromFirebase(
      String collectionName, String documentName, String secondCollectionName);
  Future<String?> registerWithEmailAndPassword(Person person);
  Future<String?> loginWithEmailAndPassword(Person person);
  Future<void> saveDataToFirestore(String collectionName, String documentName, Map<String, dynamic> model);
  Future<void> saveDataToSecondFirestore(String collectionName, String documentName, String secondCollectionName, Map<String, dynamic> model);
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getDataFromFirebaseByValue<T>(
      String collectionName, String documentName, String secondCollectionName, String property, T value);

  Future<void> updateDataToFirestore(String collectionName, String documentName, Map<String, dynamic> model);
}
