

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRecord {
  UserRecord({required this.email, required this.uid, required this.createdTime});
  UserRecord.fromUser(User? user) : this(
      email : (user?.email)!,
      uid : (user?.uid)!,
      createdTime : DateTime.now(),
  );

  String email, uid;
  DateTime createdTime;

  static CollectionReference<UserRecord> userRef = FirebaseFirestore.instance.collection('users').withConverter<UserRecord>(
    fromFirestore: (snapshot, _) => UserRecord.fromJson(snapshot.data()!),
    toFirestore: (userRecord, _) => userRecord.toJson(),
  );

  UserRecord.fromJson(Map<String, Object?> json)
  : this(
      email: json['email']! as String,
      uid : json['uid']! as String,
      createdTime: json['createdTime'] as DateTime
  );

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'uid': uid,
      'createdTime': createdTime,
    };
  }
}