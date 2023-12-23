class User {
  int id;
  String name;
  String mail;
  String? password;
  String? role;
  String? number;

  User(
      {required this.id,
      required this.name,
      required this.mail,
      required this.password,
      required this.role,
      this.number});
}
