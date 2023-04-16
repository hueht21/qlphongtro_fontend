import 'dart:convert';

class PostModel {
  PostModel({
    required this.id,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.phoneNumber,
    required this.phoneZalo,
    required this.status,
    required this.createdTime,
    required this.createdAt,
    required this.updatedAt,
    required this.numberDate,
    required this.userResponse,
    required this.areaResponse,
  });

   int? id;
   String? thumbnail;
   String? title;
   String? content;
   String? phoneNumber;
   String? phoneZalo;
   int? status;
   dynamic createdTime;
   DateTime? createdAt;
   dynamic updatedAt;
   int? numberDate;
   UserResponse? userResponse;
   AreaResponse? areaResponse;

  factory PostModel.fromJson(Map<String, dynamic> json){
    return PostModel(
      id: json["id"],
      thumbnail: json["thumbnail"],
      title: json["title"],
      content: json["content"],
      phoneNumber: json["phoneNumber"],
      phoneZalo: json["phoneZalo"],
      status: json["status"],
      createdTime: json["createdTime"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: json["updatedAt"],
      numberDate: json["numberDate"],
      userResponse: json["userResponse"] == null ? null : UserResponse.fromJson(json["userResponse"]),
      areaResponse: json["areaResponse"] == null ? null : AreaResponse.fromJson(json["areaResponse"]),
    );
  }


}

class AreaResponse {
  AreaResponse({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.exactAddress,
    required this.provinceName,
    required this.districtName,
    required this.wardName,
    required this.roomResponses,
  });

   int? id;
   String? name;
   String? longitude;
   String? latitude;
   String? exactAddress;
   String? provinceName;
   String? districtName;
   String? wardName;
   List<RoomResponse> roomResponses;

  factory AreaResponse.fromJson(Map<String, dynamic> json){
    return AreaResponse(
      id: json["id"],
      name: json["name"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      exactAddress: json["exactAddress"],
      provinceName: json["provinceName"],
      districtName: json["districtName"],
      wardName: json["wardName"],
      roomResponses: json["roomResponses"] == null ? [] : List<RoomResponse>.from(json["roomResponses"]!.map((x) => RoomResponse.fromJson(x))),
    );
  }

}

class RoomResponse {
  RoomResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.video,
    required this.electricService,
    required this.waterService,
    required this.rentPrice,
    required this.acreage,
  });

   int? id;
   String? name;
   String? description;
   String? image;
   String? video;
   double? electricService;
    double? waterService;
    double? rentPrice;
    double? acreage;

  factory RoomResponse.fromJson(Map<String, dynamic> json){
    return RoomResponse(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      video: json["video"],
      electricService: json["electricService"],
      waterService: json["waterService"],
      rentPrice: json["rentPrice"],
      acreage: json["acreage"],
    );
  }

}

class UserResponse {
  UserResponse({
    required this.id,
    required this.fullName,
  });

  final int? id;
  final String? fullName;

  factory UserResponse.fromJson(Map<String, dynamic> json){
    return UserResponse(
      id: json["id"],
      fullName: json["fullName"],
    );
  }

}


