import 'package:chatapp/data/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static User get user => auth.currentUser!;
  static Future<bool> isUserExists() async {
    return (await firebaseFirestore.collection('users').doc(user.uid).get())
        .exists;
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = Users(
      id: user.uid.toString(),
      email: user.email.toString(),
      name: user.displayName.toString(),
      about: 'Hello World',
      image: user.photoURL,
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: '',
    );

    return await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
