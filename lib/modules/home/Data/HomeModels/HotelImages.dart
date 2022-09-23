class HotelImages {
  int? id;
  String? hotelId;
  String? image;


  HotelImages(
      {this.id, this.hotelId, this.image,});

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['image'] = this.image;
    return data;
  }
}