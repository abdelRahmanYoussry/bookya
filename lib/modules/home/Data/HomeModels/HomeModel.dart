
import 'HomeData.dart';
import 'StatusModel.dart';
import 'StatusModel.dart';

class HomeModel {
  final HomeStatus? status;
  final HomeData? data;

  HomeModel({required this.status,
    required this.data
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        status: HomeStatus.fromJson(json['status']),
        data: HomeData.fromJson(json['data'])
    );

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   if (status != null) {
  //     data['status'] = status.toJson();
  //   }
  //   if (this.data != null) {
  //     data['data'] = this.data.toJson();
  //   }
  //   return data;
  // }
}
