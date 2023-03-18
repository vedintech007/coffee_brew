import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  DatabaseService({this.uid});

  String? uid;

  //collection ref
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    final document = await brewCollection.doc(uid);

    document.set(
      {
        "sugars": sugars,
        "name": name,
        "strength": strength,
      },
    );

    return document;
  }
}
