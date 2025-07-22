class WorkspacesResponse {
  final List<Workspace> workspaces;
  final List<RoomType> roomTypes;
  final int timestamp;

  WorkspacesResponse({
    required this.workspaces,
    required this.roomTypes,
    required this.timestamp,
  });

  factory WorkspacesResponse.fromJson(Map<String, dynamic> json) {
    var workspaceList = json['workspaces'] as List;
    List<Workspace> workspaces =
        workspaceList.map((i) => Workspace.fromJson(i)).toList();

    var roomTypeList = json['roomTypes'] as List;
    List<RoomType> roomTypes =
        roomTypeList.map((i) => RoomType.fromJson(i)).toList();

    return WorkspacesResponse(
      workspaces: workspaces,
      roomTypes: roomTypes,
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workspaces': workspaces.map((e) => e.toJson()).toList(),
      'roomTypes': roomTypes.map((e) => e.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}

class Workspace {
  final String id;
  final String name;
  final Location location;
  final String? image;
  final String? directory;
  final String? mapLink;
  final String openTime;
  final String closeTime;
  final String description;
  final List<Room> rooms;
  final List<Coupon> coupons;
  final List<Amenity> amenities;

  Workspace({
    required this.id,
    required this.name,
    required this.location,
    this.image,
    this.directory,
    this.mapLink,
    required this.openTime,
    required this.closeTime,
    required this.description,
    required this.rooms,
    required this.coupons,
    required this.amenities,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    var roomList = json['rooms'] as List;
    List<Room> rooms = roomList.map((i) => Room.fromJson(i)).toList();

    var couponList = json['coupons'] as List;
    List<Coupon> coupons = couponList.map((i) => Coupon.fromJson(i)).toList();

    var amenityList = json['amenities'] as List;
    List<Amenity> amenities =
        amenityList.map((i) => Amenity.fromJson(i)).toList();

    return Workspace(
      id: json['id'],
      name: json['name'],
      location: Location.fromJson(json['location']),
      image: json['image'],
      directory: json['directory'],
      mapLink: json['map_link'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
      description: json['description'],
      rooms: rooms,
      coupons: coupons,
      amenities: amenities,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location.toJson(),
      'image': image,
      'directory': directory,
      'map_link': mapLink,
      'open_time': openTime,
      'close_time': closeTime,
      'description': description,
      'rooms': rooms.map((e) => e.toJson()).toList(),
      'coupons': coupons.map((e) => e.toJson()).toList(),
      'amenities': amenities.map((e) => e.toJson()).toList(),
    };
  }
}

class Location {
  final String id;
  final String address;
  final String city;
  final String country;

  Location({
    required this.id,
    required this.address,
    required this.city,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'city': city,
      'country': country,
    };
  }
}

class Room {
  final String id;
  final String name;
  final String typeId;
  final String typeName;
  final String capacity;
  final String availableSeats;
  final String? bkcaldar;
  final String deposit;
  final String status;
  final List image;
  final List<Pricing> pricing;
  final List<Amenity> amenities;

  Room({
    required this.id,
    required this.name,
    required this.typeId,
    required this.typeName,
    required this.capacity,
    required this.availableSeats,
    required this.image,
    this.bkcaldar,
    required this.deposit,
    required this.status,
    required this.pricing,
    required this.amenities,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    var pricingList = json['pricing'] as List;
    List<Pricing> pricing =
        pricingList.map((i) => Pricing.fromJson(i)).toList();

    var amenityList = json['amenities'] as List;
    List<Amenity> amenities =
        amenityList.map((i) => Amenity.fromJson(i)).toList();

    return Room(
      id: json['id'],
      name: json['name'],
      typeId: json['typeId'],
      typeName: json['typeName'],
      capacity: json['capacity'],
      availableSeats: json['availableSeats'],
      bkcaldar: json['bkcaldar'],
      deposit: json['deposit'],
      status: json['status'],
      image: json['image'],
      pricing: pricing,
      amenities: amenities,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'typeId': typeId,
      'typeName': typeName,
      'capacity': capacity,
      'availableSeats': availableSeats,
      'bkcaldar': bkcaldar,
      'deposit': deposit,
      'status': status,
      'image': image,
      'pricing': pricing.map((e) => e.toJson()).toList(),
      'amenities': amenities.map((e) => e.toJson()).toList(),
    };
  }
}

class Pricing {
  final int price;
  final int duration;
  final int? discount;
  final int pricePerHour;

  Pricing({
    required this.price,
    required this.duration,
    this.discount,
    required this.pricePerHour,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) {
    return Pricing(
      price: json['price'],
      duration: json['duration'],
      discount: json['discount'] != null ? json['discount'] : null,
      pricePerHour: json['price_per_hour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'duration': duration,
      'discount': discount,
      'price_per_hour': pricePerHour,
    };
  }
}

class Amenity {
  final String id;
  final String name;
  final String description;

  Amenity({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}

class Coupon {
  final String id;
  final String hours;
  final List<dynamic> room; // can be extended if needed
  final String expiresAt;
  final String price;

  Coupon({
    required this.id,
    required this.hours,
    required this.room,
    required this.expiresAt,
    required this.price,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      id: json['id'],
      hours: json['hours'],
      room: json['room'],
      expiresAt: json['expiresAt'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hours': hours,
      'room': room,
      'expiresAt': expiresAt,
      'price': price,
    };
  }
}

class RoomType {
  final String id;
  final String name;

  RoomType({
    required this.id,
    required this.name,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
