class Message {
  final String message;
  final String email;
  final DateTime sentAt;
  Message(this.message, this.email, this.sentAt);

  factory Message.fromJason(jasonData) {
    return Message(jasonData['message'], jasonData['id'],
        DateTime.parse(jasonData['sentAt']));
  }
}
