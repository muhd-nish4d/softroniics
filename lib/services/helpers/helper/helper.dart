import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Helper {
  static Future<void> storeUserData(Map<String, String> userDetails) async {
    final user = FirebaseAuth.instance.currentUser!;
    final userId = user.uid;

    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('users').doc(userId);

    await userRef.set(userDetails);
  }
}
