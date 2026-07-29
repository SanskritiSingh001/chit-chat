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
}