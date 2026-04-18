class wbsList {
  int? status;
  Data? data;
  bool? success;
  String? message;

  wbsList({this.status, this.data, this.success, this.message});

  wbsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<WbsList>? wbsList;

  Data({this.wbsList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['wbsList'] != null) {
      wbsList = <WbsList>[];
      json['wbsList'].forEach((v) {
        wbsList!.add(new WbsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wbsList != null) {
      data['wbsList'] = this.wbsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WbsList {
  String? sId;
  String? title;
  String? description;
  String? media;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WbsList({this.sId, this.title, this.description, this.media, this.user, this.createdAt, this.updatedAt, this.iV});

  WbsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    media = json['media'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['media'] = this.media;
    data['user'] = this.user;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
