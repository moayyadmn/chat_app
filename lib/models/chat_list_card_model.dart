class ChatListCardModel {
  final String fromUid;
  final String toUid;
  final String fromName;
  final String toName;
  final String fromAvatar;
  final String toAvatar;
  final String lastMessage;
  final String lastTime;

  ChatListCardModel(
    this.fromUid,
    this.toUid,
    this.fromName,
    this.toName,
    this.fromAvatar,
    this.toAvatar,
    this.lastMessage,
    this.lastTime,
  );

  factory ChatListCardModel.fromDocument(jsonData) {
    return ChatListCardModel(
      jsonData['fromUid'],
      jsonData['toUid'],
      jsonData['fromName'],
      jsonData['toName'],
      jsonData['fromAvatar'],
      jsonData['toAvatar'],
      jsonData['lastMessage'],
      jsonData['lastTime'],
    );
  }
}
