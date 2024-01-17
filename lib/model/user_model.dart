class UserModel {
  String? username;
  String? email;
  String? password;

  UserModel({this.username, this.email, this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userInfo = Map<String, dynamic>();
    userInfo['username'] = username;
    userInfo['email'] = email;
    userInfo['password'] = password;
    return userInfo;
  }

  // Map<String, dynamic> userLogin() {
  //   final Map<String, dynamic> userInfo = Map<String, dynamic>();
  //   userInfo['username'] = username;
  //   userInfo['password'] = password;
  //   return userInfo;
  // }
}
