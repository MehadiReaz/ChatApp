class Users {
  String? image;
  String? name;
  String? about;
  String? createdAt;
  String? lastActive;
  bool? isOnline;
  String? id;
  String? pushToken;
  String? email;

  Users(
      {this.image,
      this.name,
      this.about,
      this.createdAt,
      this.lastActive,
      this.isOnline,
      this.id,
      this.pushToken,
      this.email});

  Users.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    createdAt = json['created_at'] ?? '';
    lastActive = json['last_active'] ?? '';
    isOnline = json['is_online'] ?? '';
    id = json['id'] ?? '';
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['last_active'] = this.lastActive;
    data['is_online'] = this.isOnline;
    data['id'] = this.id;
    data['push_token'] = this.pushToken;
    data['email'] = this.email;
    return data;
  }
}
