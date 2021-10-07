// To parse this JSON data, do
//
//     final etiquetas = etiquetasFromJson(jsonString);

import 'dart:convert';

List<Factor> factorFromJson(String str) =>
    List<Factor>.from(json.decode(str).map((x) => Factor.fromJson(x)));

String factorToJson(List<Factor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Factor {
  Factor({
    required this.id,
    required this.nombre,
    required this.factor,
    required this.codigo,
    this.abrev,
  });

  int id;
  String nombre;
  String factor;
  String codigo;
  String? abrev;

  factory Factor.fromJson(Map<String, dynamic> json) => Factor(
        id: json["Id"],
        nombre: json["Nombre"],
        factor: json["Factor"],
        codigo: json["Codigo"],
        abrev: json["Abrev"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Factor": factor,
        "Codigo": codigo,
        "Abrev": abrev,
      };
}
