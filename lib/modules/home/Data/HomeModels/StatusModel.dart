class HomeStatus {
  String? type;

  HomeStatus({this.type});

  HomeStatus.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    return data;
  }
}