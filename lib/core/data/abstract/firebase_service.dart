import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../product/models/user_model.dart';

abstract class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> getDataFromFirebase(String collectionName, String documentName);
  Future<String?> registerWithEmailAndPassword(Person person);
  Future<String?> loginWithEmailAndPassword(Person person);
}
