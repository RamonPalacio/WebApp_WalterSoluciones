import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:walte_soluciones/constant/const_state.dart';
import 'package:walte_soluciones/provider/state/main_state.dart';

/*


class ConstsMap {
  final tipoMap mapa;
  ConstsMap(this.mapa);

  String apiKey =
          'pk.eyJ1IjoicmFtb25ibGFjazE5ODciLCJhIjoiY2t0cGF0MDB5MGtvczJucDlwdTNuZzB5OCJ9.oXKozY8HtsoD7eRoSKuZsQ',
      styleMap = 'ramonblack1987/cktq0b2ky255618o3hw1oia4n',
      urlMap =
          'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      copyright = "MapBox";
}

ConstsMap constMapa = ConstsMap(tipoMap.mapbox); // Main.dart

MapaOpenSourse(
  urlTemplate: constMapa.urlMap,
  stylemap: constMapa.styleMap,
  apiKey: constMapa.apiKey,
  copyright: constMapa.copyright,
  height: 400,
  width: 500,
),


*/

class MapaOpenSourse extends StatelessWidget {
  final double height;
  final double width;
  final bool blur;
  final String apiKey;
  final String stylemap;
  final String urlTemplate;
  final String copyright;

  const MapaOpenSourse({
    Key? key,
    required this.apiKey,
    required this.stylemap,
    required this.urlTemplate,
    this.height = 500,
    this.width = 500,
    this.blur = false,
    required this.copyright,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MainState _state = context.read<MainState>();
    MapController mapController = MapController();
    context.read<MainState>().setControlador(mapController);
    LatLng markerPositionA = _state.getState(ConstState.markerA);
    LatLng markerPositionB = _state.getState(ConstState.markerB);
    LatLng actualCenter = _state.getState(ConstState.centerMap);
    Future.delayed(const Duration(seconds: 1), () {
      mapController.move(actualCenter, 15);
    });

    // List<LatLng> points2 = [];

    // for (var i in [
    //   [-73.995237, 9.99123],
    //   [-73.998537, 9.977711],
    //   [-73.954449, 9.970013],
    //   [-73.936738, 9.945233],
    //   [-73.973011, 9.926226],
    //   [-73.886375, 9.973155],
    //   [-73.979497, 10.207564],
    //   [-74.162788, 10.483546],
    //   [-74.169924, 10.590446],
    //   [-74.160727, 10.670255],
    //   [-74.115376, 10.741969],
    //   [-74.097185, 10.749405],
    //   [-74.105498, 10.79611],
    //   [-74.152807, 10.881348],
    //   [-74.115545, 10.877816],
    //   [-74.114027, 10.89037],
    //   [-74.073386, 10.898181],
    //   [-74.066131, 10.910105],
    //   [-74.038325, 10.898604],
    //   [-74.029666, 10.921425]
    // ]) {
    //   points2.add(LatLng(i[1], i[0]));
    //   // print("${i[0]},${i[1]}");
    // }
    // // print(points2);

    // // for (var i in lista) {
    // //   print("${i[0]},${i[1]}");
    // // }
    // var points = [
    //   LatLng(9.99123, -73.995237),
    //   LatLng(9.977711, -73.998537),
    //   LatLng(9.970013, -73.954449),
    //   LatLng(9.945233, -73.936738),
    //   LatLng(9.926226, -73.973011),
    //   LatLng(9.973155, -73.886375),
    //   LatLng(10.207564, -73.979497),
    //   LatLng(10.483546, -74.162788),
    //   LatLng(10.590446, -74.169924),
    //   LatLng(10.670255, -74.160727),
    //   LatLng(10.741969, -74.115376),
    //   LatLng(10.749405, -74.097185),
    //   LatLng(10.79611, -74.105498),
    //   LatLng(10.881348, -74.152807),
    //   LatLng(10.877816, -74.115545),
    //   LatLng(10.89037, -74.114027),
    //   LatLng(10.898181, -74.073386),
    //   LatLng(10.910105, -74.066131),
    //   LatLng(10.898604, -74.038325),
    //   LatLng(10.921425, -74.029666)
    // ];

    // var pointsGradient = [
    //   LatLng(10.741969, -74.115376),
    //   LatLng(10.749405, -74.097185),
    //   LatLng(10.79611, -74.105498),
    //   LatLng(10.881348, -74.152807),
    //   LatLng(10.877816, -74.115545),
    //   LatLng(10.89037, -74.114027),
    //   LatLng(10.898181, -74.073386),
    //   LatLng(10.910105, -74.066131),
    //   LatLng(10.898604, -74.038325),
    //   LatLng(10.921425, -74.029666)
    // ];
    // Logger().i("pintando dentro");

    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,

          /*
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 5.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                      points: points, strokeWidth: 4.0, color: Colors.purple),
                ],
              ),
              PolylineLayerOptions(
                polylines: [
                  Polyline(
                    points: pointsGradient,
                    strokeWidth: 4.0,
                    gradientColors: [
                      Color(0xffE40203),
                      Color(0xffFEED00),
                      Color(0xff007E2D),
                    ],
                  ),
                ],
              ),
            ],
          ),
          */
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                center: actualCenter, // InicialValue Medellin
                zoom: 15.0,
                rotation: 1),
            layers: [
              TileLayerOptions(
                urlTemplate: urlTemplate,
                additionalOptions: {
                  'accessToken': apiKey,
                  'id': stylemap,
                  "tilt": "60",
                },
              ),

              ///Linias en el mapa
              // PolylineLayerOptions(
              //   polylines: [
              //     Polyline(
              //         points: points, strokeWidth: 4.0, color: Colors.purple),
              //   ],
              // ),
              // PolylineLayerOptions(
              //   polylines: [
              //     Polyline(
              //       points: pointsGradient,
              //       strokeWidth: 4.0,
              //       gradientColors: [
              //         const Color(0xffE40203),
              //         const Color(0xffFEED00),
              //         const Color(0xff007E2D),
              //       ],
              //     ),
              //   ],
              // ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 56.0,
                    height: 107.0,
                    point: markerPositionA,
                    builder: (ctx) => Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF002EA8),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: const Text("A",
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFFFFFFFF))),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF002EA8),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 51),
                      ],
                    ),
                  ),
                  Marker(
                    width: 56.0,
                    height: 107.0,
                    point: markerPositionB,
                    builder: (ctx) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFED6C1D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: const Text("B",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFFFFFFFF))),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFED6C1D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 51),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        // FutureBuilder<String>(
        //   future: getLocation(), // a previously-obtained Future<String> or null
        //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        //     List<Widget> children;
        //     if (snapshot.hasData) {
        //       children = <Widget>[
        //         const Icon(
        //           Icons.check_circle_outline,
        //           color: Colors.green,
        //           size: 60,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 16),
        //           child: Text('Result: ${snapshot.data}'),
        //         )
        //       ];
        //     } else if (snapshot.hasError) {
        //       children = <Widget>[
        //         const Icon(
        //           Icons.error_outline,
        //           color: Colors.red,
        //           size: 60,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 16),
        //           child: Text('Error: ${snapshot.error}'),
        //         )
        //       ];
        //     } else {
        //       children = const <Widget>[
        //         SizedBox(
        //           child: CircularProgressIndicator(),
        //           width: 60,
        //           height: 60,
        //         ),
        //         Padding(
        //           padding: EdgeInsets.only(top: 16),
        //           child: Text('Awaiting result...'),
        //         )
        //       ];
        //     }
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: children,
        //       ),
        //     );
        //   },
        // ),
        //TODO_ mascara de distancia
        // ClipOval(
        //   child: Container(
        //     height: 500,
        //     width: 500,
        //     color: const Color(0xFFFFFFFF),
        //     child: SvgPicture.asset(
        //       "assets/icons/check.svg",
        //       fit: BoxFit.fitHeight,
        //       color: const Color(0xFF002EA8),
        //     ),
        //   ),
        // ),
        blur
            ? SizedBox(
                height: height,
                width: width,
              ).frosted(
                blur: 2, frostColor: const Color(0xFFFFFFFF), frostOpacity: 0)
            : const SizedBox(),
      ],
    );
  }
}
