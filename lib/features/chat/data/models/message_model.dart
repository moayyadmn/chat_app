class MessageModel {
  final String id;
  final String message;
  final String type;
  final String email;
  final String sentAt;
  MessageModel(this.id, this.message, this.type, this.email, this.sentAt);

  factory MessageModel.fromJason(jasonData) {
    return MessageModel(
      jasonData['id'],
      jasonData['message'],
      jasonData['type'],
      jasonData['email'],
      jasonData['sentAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'message': this.message,
        'type': this.type,
        'email': this.email,
        'sentAt': this.sentAt,
      };
}
