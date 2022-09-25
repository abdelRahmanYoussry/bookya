class MyBookingModel {
  MyBookingStatus? status;
  MyBookingData? data;

  MyBookingModel({this.status, this.data});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null
        ? MyBookingStatus.fromJson(json['status'])
        : null;
    data = json['data'] != null ? MyBookingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MyBookingStatus {
  String? type;

  MyBookingStatus({this.type});

  MyBookingStatus.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}

class MyBookingData {
  int? currentPage;
  List<BookingMoreInfo>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? path;
  String? perPage;
  int? to;
  int? total;

  MyBookingData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  MyBookingData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <BookingMoreInfo>[];
      json['data'].forEach((v) {
        data!.add(BookingMoreInfo.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class BookingMoreInfo {
  int? id;
  String? userId;
  String? hotelId;
  String? type;
  User? user;
  Hotel? hotel;

  BookingMoreInfo(
      {this.id, this.userId, this.hotelId, this.type, this.user, this.hotel});

  BookingMoreInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['hotel_id'] = hotelId;
    data['type'] = type;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    return data;
  }
}

class Hotel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? rate;
  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;

  Hotel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.address,
        this.rate,
        this.hotelImages,
        this.facilities});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    rate = json['rate'];
    if (json['hotel_images'] != null) {
      hotelImages = <HotelImages>[];
      json['hotel_images'].forEach((v) {
        hotelImages!.add(HotelImages.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(Facilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['address'] = address;
    data['rate'] = rate;
    if (hotelImages != null) {
      data['hotel_images'] = hotelImages!.map((v) => v.toJson()).toList();
    }
    if (facilities != null) {
      data['facilities'] = facilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? apiToken;
  User({
    this.id,
    this.name,
    this.email,
    this.apiToken,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['api_token'] = apiToken;
    return data;
  }
}

class HotelImages {
  int? id;
  String? hotelId;
  String? image;

  HotelImages({
    this.id,
    this.hotelId,
    this.image,
  });

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['image'] = image;

    return data;
  }
}

class Facilities {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Facilities({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
