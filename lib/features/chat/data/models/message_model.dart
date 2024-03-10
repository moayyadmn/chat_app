class MessageModel {
  final String id;
  final String message;
  final String type;
  final String email;
  final DateTime sentAt;
  MessageModel(this.id, this.message, this.type, this.email, this.sentAt);

  factory MessageModel.fromJason(jasonData) {
    return MessageModel(
      jasonData['id'],
      jasonData['message'],
      jasonData['type'],
      jasonData['email'],
      DateTime.parse(jasonData['sentAt']),
    );
  }
}
