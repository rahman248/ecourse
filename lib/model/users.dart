class Users {
  late final String? id;
  final String? fullName;
  final String? email;
  final String? username;
  final String? password;

  Users({this.id,  this.email, this.fullName, this.username, this.password });

  Users.fromData(Map<String, dynamic> data)
      : id = data['id'] ?? '',
        email = data['email'] ?? '',
        fullName = data['fullName'] ?? '',
        username = data['username'] ?? '',
        password = data['password'] ?? '';


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'username': username,
      'password': password,
    };
  }
}