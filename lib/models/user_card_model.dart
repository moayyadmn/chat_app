class UserCardModel {
  final String id;
  final String userName;
  // String? lastMessage;
  final String image;
  // String? date;
  UserCardModel(this.id,this.userName, this.image);

  factory UserCardModel.formJason(jsonData) {
    return UserCardModel(jsonData['id'],jsonData['userName'], jsonData['profPhoto']);
  }
}
