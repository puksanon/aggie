import 'package:aggie/pages/plot_map/map_plot_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _locationData != null ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => MapPlotScreen(location: _locationData,))) : null,
          backgroundColor: Colors.orange,
          label: Row(
            children: <Widget>[
              Text(
                'Open Maps',
                style: TextStyle(color: Colors.black87),
              ),
              Icon(
                Icons.map,
                color: Colors.black87,
              ),
            ],
          )),
    );
  }
}

