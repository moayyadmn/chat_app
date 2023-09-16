class MessageModel {
  final String message;
  final String email;
  final DateTime sentAt;
  MessageModel(this.message, this.email, this.sentAt);

  factory MessageModel.fromJason(jasonData) {
    return MessageModel(jasonData['message'], jasonData['id'],
        DateTime.parse(jasonData['sentAt']));
  }
}
