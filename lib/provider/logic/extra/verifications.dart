import 'package:walte_soluciones/database/endpoint_api.dart';

class Verifications {
  bool isValidMobil(String numCelular) {
    final bool isMovilColombia = numCelular.contains(
        RegExp(r'(\+57|0057|57)?[ -]*(3)[ -]*(10|[0-9][ -]*){9}'), 0);
    return isMovilColombia;
  }

  bool isValidEmail(String email) {
    RegExp emailRegEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    final bool isValidEmail = emailRegEx.hasMatch(email);
    return isValidEmail;
  }

  Future<bool> mobilExistsInDatabase(String numCelular) async {
    Map<String, dynamic> responseFirebase =
        await EndPointApi().getUsers(numCelular);
    if (responseFirebase['phone'].runtimeType == String) {
      return true;
    } else {
      return false;
    }
  }
}
