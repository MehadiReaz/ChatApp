import 'dart:io';

import 'package:chatapp/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;

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

  static Stream getAllUsers() {
    return firebaseFirestore
        .collection('users')
        .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }

  static Users? selfUser;

  static Future<void> getSelfUserInfo() async {
    return await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .get()
        .then((user) async {
      user.exists
          ? selfUser = Users.fromJson(user.data()!)
          : await createUser().then((value) => getSelfUserInfo());
    });
  }

  static Future<void> updateSelfUserInfo() async {
    await firebaseFirestore.collection('users').doc(user.uid).update({
      'name': selfUser?.name,
      'about': selfUser?.about,
    });
  }

  static Future<void> updateProfilePicture(File file) async {
    final ext = file.path.split('.').last;
    final ref = firebaseStorage.ref('profile_pictures/${user.uid}.$ext');
    await ref.putFile(file, SettableMetadata(contentType: 'image/${ext}'));
    selfUser?.image = await ref.getDownloadURL();
    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .update({'image': selfUser?.image});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessage() {
    return firebaseFirestore.collection('messages').snapshots();
  }
}
