class User {
  late String email;
  late String first_name;
  late String last_name;

  User({
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.email = json['email'] ?? '';
    this.first_name = json['first_name'] ?? '';
    this.last_name = json['last_name'] ?? '';
  }
}
