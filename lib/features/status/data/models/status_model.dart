class StatusModel {
  final String userName;
  final String text;
  final String time;
  final String url;

  StatusModel(
      {required this.userName,
      required this.text,
      required this.time,
      required this.url});

  factory StatusModel.fromDocument(jsonData) {
    return StatusModel(
      userName: jsonData['userName'],
      text: jsonData['text'],
      time: jsonData['time'],
      url: jsonData['url'],
    );
  }
}


/*
[
 [
  abd:{

  },
  abd:
    {

    }
 ],
 'z':{

 }
]







*/