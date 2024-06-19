import 'package:chat_app/src/data/model/group.app.dart';
import 'package:chat_app/src/data/model/user_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseApp {
  //! firebase auth users
  static CollectionReference<UsersApp> getCollectionUsers() {
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
    return await getCollectionUsers().doc(user.id).set(user);
  }

  //? get user fire base
  static Future<UsersApp?> getUserFirebase(String userId) async {
    final snapshot = await getCollectionUsers().doc(userId).get();
    return snapshot.data();
  }

  //! firebase add room
  //? get collection room
  static CollectionReference<GroupApp> getCollectionRoom() {
    return FirebaseFirestore.instance
        .collection(GroupApp.groupApp)
        .withConverter<GroupApp>(
          fromFirestore: (snapshot, options) =>
              GroupApp.fromJsonRoom(snapshot.data()!),
          toFirestore: (value, options) => value.toJsonRoom(),
        );
  }

  //? add room
  static Future<void> addRoom({required GroupApp group}) async {
    var refId = getCollectionRoom().doc();
    group.roomId = refId.id;
    return refId.set(group);
  }

  //? get room
  static Stream<QuerySnapshot<GroupApp>> getRoom() {
    return getCollectionRoom().snapshots();
  }
}
