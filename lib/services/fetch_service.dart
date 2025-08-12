import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchAndCacheUserData() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return;

    final docSnapshot = await _firestore.collection('users').doc(firebaseUser.uid).get();
    if (!docSnapshot.exists) return;
    AppData.fromMap(docSnapshot.data()!);
  }
}
