import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  // 1. collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  // user data from snapshot

  MyUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUserData(
      name: snapshot.get('name'),
      uid: uid,
      strength: snapshot.get('strength'),
      sugars: snapshot.get('sugars'),
    );
  }

  Future<dynamic> updateUserData(
      String sugars, String name, int strength) async {
    return await brewCollection.doc(uid!).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 0,
        sugars: doc.get('sugars') ?? '0',
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<MyUserData?> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
