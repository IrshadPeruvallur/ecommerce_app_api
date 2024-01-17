class UserModel {
  String? username;
  String? email;
  String? password;

  UserModel(this.username, this.email, this.password);
  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> userInfo = Map<String, dynamic>();
    userInfo['username'] = username;
    userInfo['email'] = email;
    userInfo['password'] = password;
    return userInfo;
  }
}
