import 'package:walte_soluciones/constant/url_sourse.dart';
import 'package:walte_soluciones/data/models/model_coordenadas.dart';
import 'package:http/http.dart' as http;

abstract class GetCoordenadas {
  Future<Coordenadas> getCoordenadas(String address) async {
    Uri url = Uri.parse(
        UrlSource().addresstoLatLong.replaceAll("{address}", address));
    try {
      var response = await http.get(
        url,
      );
      return coordenadasFromJson(response.body);
    } catch (e) {
      return coordenadasFromJson(
          '''{"error_message": "Error request","results": [],"status": "ERROR_REQUEST"}''');
    }
  }
}
