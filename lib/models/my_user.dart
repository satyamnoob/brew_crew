class MyUser {
  final String? uid;

  MyUser({this.uid});
}

class MyUserData {
  final String? uid;
  final String? name;
  final String? sugars;
  final int? strength;

  MyUserData({
    this.name,
    this.strength,
    this.sugars,
    this.uid,
  });
}
