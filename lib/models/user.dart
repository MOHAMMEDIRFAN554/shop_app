class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
      );

  Map<String, dynamic> toMap() {
    return {
      "id":
          id, 
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
