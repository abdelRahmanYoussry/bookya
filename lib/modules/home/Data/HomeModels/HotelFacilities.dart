class HotelFacilities {
  int? id;
  String? hotelId;
  String? facilityId;


  HotelFacilities(
      {this.id, this.hotelId, this.facilityId, });

  HotelFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['facility_id'] = this.facilityId;
    return data;
  }
}
