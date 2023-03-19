import "package:cloud_firestore/cloud_firestore.dart";
import "package:ninja_brew_crew/models/brew.dart";
import "package:ninja_brew_crew/models/user.dart";

class DatabaseService {
  DatabaseService({this.uid});

  String? uid;

  //collection ref
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    final document = brewCollection.doc(uid); // await

    document.set(
      {
        "sugars": sugars,
        "name": name,
        "strength": strength,
      },
    );

    return document;
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (doc) => Brew(
            name: (doc.data() as Map<String, dynamic>)['name'],
            sugars: (doc.data() as Map<String, dynamic>)['sugars'] ?? '',
            strength: (doc.data() as Map<String, dynamic>)['strength'] ?? 0,
          ),
        )
        .toList();
  }

  // user data from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: (snapshot.data() as Map<String, dynamic>)['name'],
      sugars: (snapshot.data() as Map<String, dynamic>)['sugars'],
      strength: (snapshot.data() as Map<String, dynamic>)['strength'],
    );
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user docs stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
