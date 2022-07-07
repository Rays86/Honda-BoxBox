import 'package:pi/models/boxbox.dart';
import 'package:pi/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference boxboxCollection =
      Firestore.instance.collection('boxbox');

  Future<void> updateUserData(String name, String phoneNumber, String email,
      {String}) async {
    return await boxboxCollection.document(uid).setData({
      'Name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    });
  }

  // boxbox list from snapshot
  List<BoxBox> _boxboxListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return BoxBox(
          name: doc.data['name'] ?? '',
          phoneNumber: doc.data['phoneNumber'] ?? '',
          email: doc.data['email'] ?? '');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        phoneNumber: snapshot.data['phoneNumber'],
        email: snapshot.data['email']);
  }

  // get boxbox stream
  Stream<List<BoxBox>> get boxbox {
    return boxboxCollection.snapshots().map(_boxboxListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return boxboxCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  collection(String s) {}

  add(Map<String, String> map) {}
}
