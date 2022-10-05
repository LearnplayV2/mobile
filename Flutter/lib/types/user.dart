class User {
  String? uuid;
  String? name;
  String? password;
  String? email;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? token;
  UserItems? userItems;

  User(
      {this.uuid,
      this.name,
      this.password,
      this.email,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.userItems});

  User.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
    userItems = json['user_items'] != null
        ? new UserItems.fromJson(json['user_items'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['token'] = this.token;
    if (this.userItems != null) {
      data['user_items'] = this.userItems!.toJson();
    }
    return data;
  }

}

class UserItems {
  String? uuid;
  String? userId;
  String? photo;

  UserItems({this.uuid, this.userId, this.photo});

  UserItems.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    userId = json['userId'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['userId'] = this.userId;
    data['photo'] = this.photo;
    return data;
  }
}