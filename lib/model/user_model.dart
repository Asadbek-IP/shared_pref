class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});

  factory UserModel.fromJson(Map json) {
    return UserModel(email: json['email'], password: json['password']);
  }

  Map toJson() {
    return {'email': email, 'password': password};
  }
}
