import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_launcher/map_launcher.dart' as map;
import "package:latlong/latlong.dart";

class MapLauncher extends StatefulWidget {
  @override
  _MapLauncherState createState() => _MapLauncherState();
}

class _MapLauncherState extends State<MapLauncher> {
  openMapsSheet(context) async {
    try {
      final coords = map.Coords(10.527642, 76.214432);
      final title = "Ocean Beach";
      final availableMaps = await map.MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: new MapOptions(
            center: new LatLng(10.527642, 76.214432), zoom: 13.0),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/mujeeb1027/ckfpobbm519nh19oi9fw3lxhj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibXVqZWViMTAyNyIsImEiOiJjazNndGVtZXgwNWU3M25xZGhxeTNtYzRuIn0.dMunxN2KHyZYhcutlc_E6w",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoibXVqZWViMTAyNyIsImEiOiJja2ZwbnM0dWgwYXV2MnFwYmpxM21pZGx1In0.bi667tPWawTxonkGP5HDWQ',
                'id': 'mapbox.streets',
              }),
          MarkerLayerOptions(markers: [
            Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(10.527642, 76.214432),
                builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Container(
                                  color: Colors.white,
                                  child: ListView(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.location_on),
                                        iconSize: 80,
                                        onPressed: () {},
                                        color: Colors.red,
                                      ),
                                      Container(
                                        child: Image.asset(
                                          'images/iconTaj.png',
                                          width: 200,
                                          height: 200,
                                        ),
                                        height: 200,
                                        width: 200,
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 60,
                                          child: FlatButton(
                                            onPressed: () {
                                              openMapsSheet(context);
                                            },
                                            child: Text(
                                              'Get Direction',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color: Colors.grey)),
                                            color: Colors.red,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ))
          ])
        ],
      ),
    );
  }
}
