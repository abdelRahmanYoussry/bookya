class RegisterResponseModel {
  Status? status;
  Data? data;

  RegisterResponseModel({this.status, this.data});

  RegisterResponseModel.fromJsonForStatus(Map<String, dynamic> json) {
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
  }
  fromJsonForData(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  String? type;
  Title? title;

  Status({this.type, this.title});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    return data;
  }
}

class Title {
  String? ar;
  String? en;

  Title({this.ar, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? apiToken;
  Null? image;
  String? createdAt;
  String? updatedAt;
  Null? googleId;
  Null? provider;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.apiToken,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.googleId,
        this.provider});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    googleId = json['google_id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['google_id'] = this.googleId;
    data['provider'] = this.provider;
    return data;
  }
}
