class HotelsResponse {
  MyData? myData;

  HotelsResponse({ this.myData});

  HotelsResponse.fromJson(Map<String, dynamic> json) {
    myData =
    json['data'] != null ?  MyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    
    if (myData != null) {
      data['data'] = myData!.toJson();
    }
    return data;
  }
}

class Status {
  String? type;

  Status({this.type});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['type'] = type;
    return data;
  }
}

class MyData {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  String? perPage;
  int? to;
  int? total;

  MyData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  MyData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add( Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['current_page'] = currentPage;
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<HotelFacilities>? hotelFacilities;

  Data(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.address,
        this.longitude,
        this.latitude,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.hotelImages,
        this.hotelFacilities});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['hotel_images'] != null) {
      hotelImages = <HotelImages>[];
      json['hotel_images'].forEach((v) {
        hotelImages!.add( HotelImages.fromJson(v));
      });
    }
    if (json['hotel_facilities'] != null) {
      hotelFacilities = <HotelFacilities>[];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities!.add( HotelFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (hotelImages != null) {
      data['hotel_images'] = hotelImages!.map((v) => v.toJson()).toList();
    }
    if (hotelFacilities != null) {
      data['hotel_facilities'] =
          hotelFacilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['image'] = image;
    return data;
  }
}

class HotelFacilities {
  int? id;
  String? hotelId;
  String? facilityId;


  HotelFacilities(
      {this.id, this.hotelId, this.facilityId,});

  HotelFacilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['facility_id'] = facilityId;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
