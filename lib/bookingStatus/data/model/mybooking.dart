class MyBookingModel {
  MyBookingStatus? status;
  MyBookingData? data;
  MyBookingModel({this.status, this.data});
  MyBookingModel.fromJson(Map<String, dynamic> json) {
    status = MyBookingStatus.fromJson(json['status']);
    data == MyBookingData.fromJson(json['data']);
  }
}

class MyBookingStatus {
  int? status;
  MyBookingStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}

class MyBookingData {
  int? id;
  int? user_id;
  int? hotel_id;
  String? type;
  HotelData? hotelinfo;
  MyBookingData({this.id, this.hotel_id, this.user_id, this.type});

  MyBookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    hotel_id = json['hotel_id'];
    type = json['type'];
    hotelinfo = HotelData.fromJson(json['hotel']);
  }
}

class HotelData {
  int? id;
  String? name;
  String? description;
  int? price;
  String? address;
  double? rate;
  HotelData(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.rate});
  HotelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    rate = json['rate'];
  }
}
