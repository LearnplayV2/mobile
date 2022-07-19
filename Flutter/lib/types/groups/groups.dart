class GroupsType {
  int? page;
  int? totalPages;
  bool? hasNextPage;
  int? totalItems;
  List<Groups>? groups;

  GroupsType(
      {this.page,
      this.totalPages,
      this.hasNextPage,
      this.totalItems,
      this.groups});

  GroupsType.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    totalItems = json['totalItems'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['hasNextPage'] = this.hasNextPage;
    data['totalItems'] = this.totalItems;
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  String? uuid;
  String? title;
  String? description;
  String? visibility;
  String? createdAt;
  String? updatedAt;
  List<Staffs>? staffs;

  Groups(
      {this.uuid,
      this.title,
      this.description,
      this.visibility,
      this.createdAt,
      this.updatedAt,
      this.staffs});

  Groups.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    visibility = json['visibility'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['staffs'] != null) {
      staffs = <Staffs>[];
      json['staffs'].forEach((v) {
        staffs!.add(new Staffs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['description'] = this.description;
    data['visibility'] = this.visibility;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.staffs != null) {
      data['staffs'] = this.staffs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Staffs {
  int? id;
  String? groupId;
  String? staffId;
  Staff? staff;

  Staffs({this.id, this.groupId, this.staffId, this.staff});

  Staffs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['groupId'];
    staffId = json['staffId'];
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupId'] = this.groupId;
    data['staffId'] = this.staffId;
    if (this.staff != null) {
      data['staff'] = this.staff!.toJson();
    }
    return data;
  }
}

class Staff {
  String? uuid;
  String? name;

  Staff(
      {this.uuid,
      this.name,
      });

  Staff.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    return data;
  }
}