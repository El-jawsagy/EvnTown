import 'package:evntown/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = result.user;
    return firebaseUser;
  }

  Future<FirebaseUser> register(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser = result.user;
    return firebaseUser;
  }

  Future<FirebaseUser> gerCurrentUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    return firebaseUser;
  }

  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    return null;
  }

  Future<User> updateProfile(User user) {
    // TODO: implement updateProfile
    return null;
  }

  singOut() {
    _auth.signOut();
  }
}
