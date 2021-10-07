class ServerUrl {
  final String _serverSms = "http://159.65.219.243/";
  final String _serverGeo = "http://159.65.219.243/";

  final String _sendOTP = "api/otp/generate";
  final String _checkOTP = "api/otp/validate";

  String get server => _serverSms;
  String get sendOTP => _serverSms + _sendOTP;
  String get checkOTP => _serverSms + _checkOTP;
}
