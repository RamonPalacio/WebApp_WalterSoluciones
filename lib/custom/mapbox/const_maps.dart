enum tipoMap {
  mapbox,
  googlemaps,
  openSourseMap,
}

class ConstsMap {
  ConstsMap();

  String apiKey =
          'pk.eyJ1IjoicmFtb25ibGFjazE5ODciLCJhIjoiY2t0cGF0MDB5MGtvczJucDlwdTNuZzB5OCJ9.oXKozY8HtsoD7eRoSKuZsQ',
      styleMap = 'ramonblack1987/cktq0b2ky255618o3hw1oia4n',
      urlMap =
          'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      copyright = "MapBox";
}
