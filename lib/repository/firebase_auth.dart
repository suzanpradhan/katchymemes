import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> createAccountWithEmail(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signInAccountWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errormessage = "Login Failed!";
      if (e.code == 'user-not-found') {
        errormessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errormessage = 'Wrong password provided for user.';
      }
      return Future.error(errormessage);
    } catch (e) {
      return Future.error("Login Failed!");
    }
  }

  Future<bool> isLoggedIn() async {
    final user = _firebaseAuth.currentUser; //check if user is logged in or not
    return user != null;
  }
}
