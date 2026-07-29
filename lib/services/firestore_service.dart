import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference<Map<String, dynamic>> usersCollection =
  FirebaseFirestore.instance.collection('users');

  // Create User
  Future<void> createUser(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: ${e.toString()}');
    }
  }

  // Get User
  Future<UserModel?> getUser(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
      await usersCollection.doc(userId).get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromMap(doc.data()!);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get user: ${e.toString()}');
    }
  }

  // Update Online Status
  Future<void> updateUserOnlineStatus(
      String uid,
      bool isOnline,
      ) async {
    try {
      await usersCollection.doc(uid).update({
        'isOnline': isOnline,
        'lastSeen': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      throw Exception(
        'Failed to update online status: ${e.toString()}',
      );
    }
  }

  // Update User
  Future<void> updateUser(UserModel user) async {
    try {
      await usersCollection.doc(user.id).update(user.toMap());
    } catch (e) {
      throw Exception('Failed to update user: ${e.toString()}');
    }
  }

  // Delete User
  Future<void> deleteUser(String uid) async {
    try {
      await usersCollection.doc(uid).delete();
    } catch (e) {
      throw Exception('Failed to delete user: ${e.toString()}');
    }
  }
}