
final String tableLogin = 'login';

class LoginFields{
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
}

class Login{
  int? id;
  String? username;
  String? password;

  Login({
    this.id,
    required this.username,
    required this.password
  });

  Map<String, Object?> toJson()=>{
    LoginFields.id: id,
    LoginFields.username: username,
    LoginFields.password: password
  };

  Login copy({
    int? id,
    String? username,
    String? password,
  })=>
  Login(
      id: id?? this.id,
      username: username ?? this.username,
      password: password ?? this.password
  );

  Login.fromMap(Map<String, dynamic> map) {
    username = map['userId'];
    password = map['password'];
  }


}