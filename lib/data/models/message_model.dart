class Message {
  String? msg;
  String? read;
  String? told;
  Type? type;
  String? fromId;
  String? sent;

  Message({this.msg, this.read, this.told, this.type, this.fromId, this.sent});

  Message.fromJson(Map<String, dynamic> json) {
    msg = json['msg'].toString();
    read = json['read'].toString();
    told = json['told'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
    fromId = json['fromId'].toString();
    sent = json['sent'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['read'] = this.read;
    data['told'] = this.told;
    data['type'] = this.type;
    data['fromId'] = this.fromId;
    data['sent'] = this.sent;
    return data;
  }
}

enum Type { text, image }
