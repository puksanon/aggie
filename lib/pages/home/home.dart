import 'package:aggie/pages/home/components/loadding.dart';
import 'package:aggie/pages/home/components/map_page.dart';
import 'package:aggie/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LatLng _currentLocation;

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  initLocation() {
    // final location = await getCurrentLocation();
    this._currentLocation = LatLng(12.704434, 101.1473517);
    setStateIfMounted(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: _currentLocation != null
            ? MapPage(
                latLng: _currentLocation,
              )
            : LoadingScreen());
  }
}
