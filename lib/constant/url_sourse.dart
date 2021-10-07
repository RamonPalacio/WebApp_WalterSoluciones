class UrlSource {
  final Uri _loremList = Uri.parse(
      "https://baconipsum.com/api/?type=all-meat&paras=20&start-with-lorem=1");
  Uri get loremList => _loremList;

  final String _factor =
      "https://servicios.ine.es/wstempus/js/ES/ESCALAS?page={2}";
  String get factor => _factor;
}
