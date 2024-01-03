class MessageModel {
  final String message;
  final String type;
  final String email;
  final DateTime sentAt;
  MessageModel(this.message, this.type, this.email, this.sentAt);

  factory MessageModel.fromJason(jasonData) {
    return MessageModel(
      jasonData['message'],
      jasonData['type'],
      jasonData['id'],
      DateTime.parse(jasonData['sentAt']),
    );
  }
}
