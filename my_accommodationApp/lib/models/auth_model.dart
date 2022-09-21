import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  Future<String> signIn(String email, String password) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
