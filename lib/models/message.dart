class Message {
  final String message;
  final String email;

  Message(this.message,this.email);

  factory Message.fromJason(jasonData) {
    return Message(jasonData['message'] , jasonData['id']);
  }
}
