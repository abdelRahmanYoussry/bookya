
import '../../../../shared/network/base_response_model.dart';
import '../../../login/data/login_response_model.dart';
import 'HomeData.dart';

class HomeModel {
  Status? status;
  HomeData? data;

  HomeModel({this.status, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}









