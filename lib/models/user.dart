class User {
  final String uid;

  User({required this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String phoneNumber;
  final String email;

  UserData(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      required this.email});
}
