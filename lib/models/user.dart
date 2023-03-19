class UserModel {
  UserModel({
    required this.uid,
  });
  final String uid;
}

class UserData {
  UserData({
    this.name,
    this.sugars,
    this.strength,
    this.uid,
  });

  final String? uid, name, sugars;
  final int? strength;
}
