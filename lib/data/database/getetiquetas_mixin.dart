import 'package:walte_soluciones/constant/url_sourse.dart';
import 'package:walte_soluciones/data/models/model_etiquetas.dart';
import 'package:http/http.dart' as http;

abstract class GetEtiquetas {
  Future<List<String>> getEtiquetas() async {
    Uri url = UrlSource().loremList;
    try {
      var response = await http.get(
        url,
      );
      // print(response.statusCode);
      return etiquetasFromJson(response.body);
    } catch (e) {
      // print("Error");
      return etiquetasFromJson('["Error","En","Consulta"]');
    }
  }
}
