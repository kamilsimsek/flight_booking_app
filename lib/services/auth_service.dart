import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Fluttertoast.showToast(
            msg: "Giriş Başarılı", toastLength: Toast.LENGTH_LONG);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> signUp(
      {required String displayName,
      required email,
      required String password,
      bool? admin}) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        _registerUser(
            displayName: displayName, email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> _registerUser({
    required String displayName,
    required email,
    required String password,
    bool isAnonymous = false,
  }) async {
    await userCollection.doc().set({
      "name": displayName,
      "email": email,
      "password": password,
      "isAnonymous": isAnonymous,
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
