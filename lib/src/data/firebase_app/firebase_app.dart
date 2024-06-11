import 'package:chat_app/src/data/model/user_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseApp {
  static CollectionReference<UsersApp> getCollectionFirebaseFireStor() {
    return FirebaseFirestore.instance
        .collection(UsersApp.collectionName)
        .withConverter<UsersApp>(
          fromFirestore: (snapshot, options) =>
              UsersApp.fromJson(snapshot.data()!),
          toFirestore: (UsersApp value, options) => value.toJson(),
        );
  }

  //? add user fire base
  static void registerUserFirebase(UsersApp user) async {
    return await getCollectionFirebaseFireStor().doc(user.id).set(user);
  }

  //? get user fire base
  static Future<UsersApp?> getUserFirebase(String userId) async {
    final snapshot = await getCollectionFirebaseFireStor().doc(userId).get();
    return snapshot.data();
  }
}
