class UrlSource {
  final Uri _loremList = Uri.parse(
      "https://baconipsum.com/api/?type=all-meat&paras=20&start-with-lorem=1");
  Uri get loremList => _loremList;

  final String _factor =
      "https://servicios.ine.es/wstempus/js/ES/ESCALAS?page={2}";
  String get factor => _factor;

  static const String _googlewebKey = "AIzaSyCEnMjJv9adozTmNK5EL02suuyX25dLTsc";
  static const String _googleappKey = "AIzaSyDI7nWwKvTCheygAE5dQrh8Lh5jSdL0Ajc";

  static const String _googlecoordenadas =
      "https://maps.googleapis.com/maps/api/geocode/json?address={address}&key=$_googleappKey";
  String get addresstoLatLong => _googlecoordenadas;

  static const String _serverSms = "http://159.65.219.243/";
  String get server => _serverSms;

  final String _sendOTP = "api/otp/generate";
  String get sendOTP => _serverSms + _sendOTP;

  final String _checkOTP = "api/otp/validate";
  String get checkOTP => _serverSms + _checkOTP;
}
