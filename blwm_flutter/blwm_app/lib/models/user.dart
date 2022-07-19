class User {
  int id;
  // String name;
  String email;
  int customRoleId;

  User({required this.id, required this.email, required this.customRoleId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      customRoleId: json['custom_role_id'],
      email: json['email'],
    );
  }
}
