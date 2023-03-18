import "package:cloud_firestore/cloud_firestore.dart";
import "package:ninja_brew_crew/models/brew.dart";

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

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
