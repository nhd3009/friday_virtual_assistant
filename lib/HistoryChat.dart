class Historychat {
  int? id;
  String? question;
  String? content;
  bool? isImage;

  Historychat({this.id, this.question, this.content, this.isImage});

  Historychat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    content = json['content'];
    isImage = json['isImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['question'] = this.question;
    data['content'] = this.content;
    data['isImage'] = this.isImage.toString();
    return data;
  }
}
