import 'package:latlong2/latlong.dart';

class ConstsMap {
  ConstsMap();

  static const String apiKey =
      'pk.eyJ1IjoicmFtb25ibGFjazE5ODciLCJhIjoiY2t0cGF0MDB5MGtvczJucDlwdTNuZzB5OCJ9.oXKozY8HtsoD7eRoSKuZsQ';

  static const String styleMap = 'ramonblack1987/cktq0b2ky255618o3hw1oia4n';

  static const String urlMap =
      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}';

  static const String copyright = "MapBox";

  static final LatLng medellinLatLng = LatLng(6.246727, -75.566189);
  static final LatLng bogotaLatLng = LatLng(4.689466, -74.068881);
  static final LatLng ciudadDeMexicoLatLng = LatLng(19.466878, -99.103316);
}
