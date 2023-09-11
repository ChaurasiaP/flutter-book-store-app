import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDB{

  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> createNote(String deviceID, String collectionName, String title, String content) async{
    final documentRef = _firestore
        .collection(_auth.currentUser!.email!)
        .doc(deviceID)
        .collection(collectionName)
        .doc();
    documentRef.set({
      "id": documentRef.id,
      "title": title,
      "content": content
    });
  }
}