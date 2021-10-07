// To parse this JSON data, do
//
//     final getAddress = getAddressFromJson(jsonString);

import 'dart:convert';

GetAddress getAddressFromJson(String str) =>
    GetAddress.fromJson(json.decode(str));

String getAddressToJson(GetAddress data) => json.encode(data.toJson());

class GetAddress {
  GetAddress({
    required this.version,
    required this.status,
    required this.statusCode,
    required this.message,
    required this.href,
    required this.data,
  });

  String version;
  String status;
  int statusCode;
  String message;
  String href;
  Data data;

  factory GetAddress.fromJson(Map<String, dynamic> json) => GetAddress(
        version: json["version"],
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        href: json["href"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "status": status,
        "status_code": statusCode,
        "message": message,
        "href": href,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.type,
    required this.properties,
    required this.coordinates,
    required this.recharge,
    required this.nearbycity,
  });

  String type;
  Properties properties;
  List<double> coordinates;
  String recharge;
  String nearbycity;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        recharge: json["recharge"],
        nearbycity: json["nearbycity"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties.toJson(),
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "recharge": recharge,
        "nearbycity": nearbycity,
      };
}

class Properties {
  Properties({
    required this.country,
    required this.address,
    required this.city,
    required this.postcode,
    required this.admin1,
    required this.admin2,
    required this.admin3,
    required this.admin4,
    required this.admin5,
    required this.attribution,
    required this.accuracy,
    required this.commonName,
    this.id,
  });

  String country;
  String address;
  String city;
  String postcode;
  String admin1;
  String admin2;
  String admin3;
  String admin4;
  String admin5;
  String attribution;
  String accuracy;
  String commonName;
  dynamic id;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        country: json["country"],
        address: json["address"],
        city: json["city"],
        postcode: json["postcode"],
        admin1: json["admin1"],
        admin2: json["admin2"],
        admin3: json["admin3"],
        admin4: json["admin4"],
        admin5: json["admin5"],
        attribution: json["attribution"],
        accuracy: json["accuracy"],
        commonName: json["commonName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "address": address,
        "city": city,
        "postcode": postcode,
        "admin1": admin1,
        "admin2": admin2,
        "admin3": admin3,
        "admin4": admin4,
        "admin5": admin5,
        "attribution": attribution,
        "accuracy": accuracy,
        "commonName": commonName,
        "id": id,
      };
}
