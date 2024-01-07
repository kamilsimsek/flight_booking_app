import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      /*if (userCredential.user != null) {
        Fluttertoast.showToast(
            msg: "Giriş Başarılı", toastLength: Toast.LENGTH_LONG);
      }*/
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email.');
      } else if (e == 'wrong-password') {
        print('Wrong password provided.');
      } else
        print(e.code);
    }
    return user;
  }

  Future<void> signUp(
      {required String name,
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
        _registerUser(name: name, email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> _registerUser({
    required String name,
    required email,
    required String password,
    // ignore: unused_element
    bool isAnonymous = false,
  }) async {
    await userCollection.doc().set({
      "name": name,
      "email": email,
      "password": password,
      "admin": false,
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
