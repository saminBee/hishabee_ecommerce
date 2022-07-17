// To parse this JSON data, do
//
//     final division = divisionFromJson(jsonString);

import 'dart:convert';

List<Division> divisionFromJson(String str) => List<Division>.from(json.decode(str).map((x) => Division.fromJson(x)));

String divisionToJson(List<Division> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Division {
  Division({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.districts,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<District>? districts;

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "districts": List<dynamic>.from(districts!.map((x) => x.toJson())),
  };
}

class District {
  District({
    this.id,
    this.name,
    this.divisionId,
    this.createdAt,
    this.updatedAt,
    this.areas,
  });

  int? id;
  String? name;
  int? divisionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Area>? areas;

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
    divisionId: json["division_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "division_id": divisionId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "areas": List<dynamic>.from(areas!.map((x) => x.toJson())),
  };
}

class Area {
  Area({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.districtId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  double? lat;
  double? lng;
  int? districtId;
  dynamic createdAt;
  dynamic updatedAt;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    districtId: json["district_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lat": lat,
    "lng": lng,
    "district_id": districtId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
