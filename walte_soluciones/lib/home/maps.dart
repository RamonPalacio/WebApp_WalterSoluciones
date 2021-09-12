import 'dart:html' show DivElement;

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(6.2442023, -75.536231);

      // another location
      final myLatlng2 = LatLng(6.2442023, -75.556231);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(6.2442023, -75.516231);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      final marker = Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!'
        ..label = 'h'
        ..icon =
            'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

      // Another marker
      Marker(
        MarkerOptions()
          ..position = myLatlng2
          ..map = map,
      );

      final infoWindow =
          InfoWindow(InfoWindowOptions()..content = contentString);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}

var contentString = '''<div id="content"> 
    <h1 id="firstHeading" class="firstHeading">Medellin</h1> 
    <div id="bodyContent"> 
    <p><b>Medellin</b>Contenido 
    </div> 
    </div>;''';
