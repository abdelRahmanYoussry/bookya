class Links {

  String? label;
  bool? active;

  Links({ this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}