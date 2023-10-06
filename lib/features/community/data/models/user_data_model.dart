class UserDataModel {
  String id;
  String userName;
  String email;
  String photoUrl;
  UserDataModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.photoUrl});

  factory UserDataModel.fromDocument(jsonData) {
    UserDataModel userDataModel = UserDataModel(
        id: jsonData['id'],
        userName: jsonData['userName'],
        email: jsonData['email'],
        photoUrl: jsonData['photoUrl']);

    return userDataModel;
  }
}
