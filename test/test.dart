void main() {
  Map<String, String> mapa = {"hola": "uno", "como": "dos", "estas": "tres"};
  String? valor = agregar(true);
  List<String>? path = [];
  path = [];
  path.add(mapa.toString() + valor.toString());
  for (var element in path) {
    // ignore: avoid_print
    print("hola$element");
  }
}

agregar(valor) {
  if (valor) {
    return "hola";
  }
}
