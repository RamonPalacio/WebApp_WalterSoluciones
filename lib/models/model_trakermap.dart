// To parse this JSON data, do
//
//     final trakerMap = trakerMapFromJson(jsonString);

import 'dart:convert';

TrakerMap trakerMapFromJson(String str) => TrakerMap.fromJson(json.decode(str));

String trakerMapToJson(TrakerMap data) => json.encode(data.toJson());

class TrakerMap {
  TrakerMap({
    required this.code,
    required this.waypoints,
    required this.routes,
  });

  String code;
  List<Waypoint> waypoints;
  List<Route> routes;

  factory TrakerMap.fromJson(Map<String, dynamic> json) => TrakerMap(
        code: json["code"],
        waypoints: List<Waypoint>.from(
            json["waypoints"].map((x) => Waypoint.fromJson(x))),
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
      };
}

class Route {
  Route({
    // required this.legs,
    // required this.weightName,
    required this.geometry,
    // required this.weight,
    // required this.distance,
    required this.duration,
  });

  // List<Leg> legs;
  // String weightName;
  Geometry geometry;
  // double weight;
  // int distance;
  double duration;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        // legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        // weightName: json["weight_name"],
        geometry: Geometry.fromJson(json["geometry"]),
        // weight: json["weight"].toDouble(),
        // distance: json["distance"],
        duration: json["duration"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        // "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        // "weight_name": weightName,
        "geometry": geometry.toJson(),
        // "weight": weight,
        // "distance": distance,
        "duration": duration,
      };
}

class Geometry {
  Geometry({
    required this.coordinates,
    required this.type,
  });

  List<List<double>> coordinates;
  String type;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: List<List<double>>.from(json["coordinates"]
            .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(
            coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type,
      };
}

class Leg {
  Leg({
    required this.weight,
    required this.distance,
    required this.summary,
    required this.duration,
  });

  double weight;
  int distance;
  String summary;
  double duration;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        weight: json["weight"].toDouble(),
        distance: json["distance"],
        summary: json["summary"],
        duration: json["duration"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "distance": distance,
        "summary": summary,
        "duration": duration,
      };
}

class Waypoint {
  Waypoint({
    required this.hint,
    required this.distance,
    required this.location,
    required this.name,
  });

  String hint;
  double distance;
  List<double> location;
  String name;

  factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        hint: json["hint"],
        distance: json["distance"].toDouble(),
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "hint": hint,
        "distance": distance,
        "location": List<dynamic>.from(location.map((x) => x)),
        "name": name,
      };
}
