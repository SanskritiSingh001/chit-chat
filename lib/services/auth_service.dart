import 'package:chat_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  User? get currentUser => _auth.currentUser;

  String? get currentUserId => _auth.currentUser?.uid;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Login
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {
        await _firestoreService.updateUserOnlineStatus(user.uid, true);

        return await _firestoreService.getUser(user.uid);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to Sign In: ${e.toString()}');
    }
  }

  // Register
  Future<UserModel?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {
        await user.updateDisplayName(displayName);

        UserModel userModel = UserModel(
          id: user.uid,
          email: email,
          displayName: displayName,
          photoURL: '',
          isOnline: true,
          lastSeen: DateTime.now(),
          createdAt: DateTime.now(),
        );

        await _firestoreService.createUser(userModel);

        return userModel;
      }

      return null;
    } catch (e) {
      throw Exception('Failed to Register: ${e.toString()}');
    }
  }
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: ${e.toString()}');
    }
  }
  Future<void> signOut() async {
    try {
      if (_auth.currentUser != null) {
        await _firestoreService.updateUserOnlineStatus(
          _auth.currentUser!.uid,
          false,
        );
      }
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }
  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null){
        await _firestoreService.deleteUser(user.uid);
        await user.delete();
      }
    } catch (e) {
      throw Exception('Failed to Delete Account: ${e.toString()}');
    }
  }
}