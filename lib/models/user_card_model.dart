class UserCardModel {
  final String userName;
  // String? lastMessage;
  // String? image;
  // String? date;
  UserCardModel(this.userName);

  factory UserCardModel.formJason(jsonData) {
    return UserCardModel(
      jsonData['userName'],
    );
  }
}
