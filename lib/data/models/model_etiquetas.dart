// To parse this JSON data, do
//
//     final etiquetas = etiquetasFromJson(jsonString);

import 'dart:convert';

List<String> etiquetasFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String etiquetasToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
