import 'package:aggie/constant.dart';
import 'package:aggie/router/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPage extends StatefulWidget {
  final LatLng latLng;

  MapPage({@required this.latLng}) : super();

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapPage> {
  handleOnPlacePicked(PickResult result) {
    final location =
        LatLng(result.geometry.location.lat, result.geometry.location.lng);
    print(result.geometry.location.lat);
    print(result.geometry.location.lng);
    print(result.formattedAddress);
    PageRouter.goToPostPage(context, location, result.formattedAddress);
  }

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      region: '.th',
      autocompleteLanguage: 'th',
      apiKey: mapApiKey,
      initialPosition: widget.latLng,
      useCurrentLocation: true,
      onPlacePicked: handleOnPlacePicked,
    );
  }
}
