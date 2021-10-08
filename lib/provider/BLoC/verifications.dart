import 'package:walte_soluciones/data/database/endpoint_api.dart';

class Verifications {
  bool verificarCelular(String numCelular) {
    final bool isMovilColombia = numCelular.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);
    return isMovilColombia;
  }

  Future<bool> celularExisteFirebase(String numCelular) async {
    Map<String, dynamic> responseFirebase =
        await EndPointApi().getUsers(numCelular);
    if (responseFirebase['phone'].runtimeType == String) {
      return true;
    } else {
      return false;
    }
  }
}
