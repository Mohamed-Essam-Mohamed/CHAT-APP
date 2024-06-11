class UsersApp {
  static const String collectionName = 'users';
  final String id;
  final String name;
  final String email;
  final String password;

  UsersApp(
      {required this.name,
      required this.email,
      required this.password,
      required this.id});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
      };
  UsersApp.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          password: json['password'],
        );
}
