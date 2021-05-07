import 'package:aggie/pages/plot_map/components/DrawMapBody.dart';
import 'package:flutter/material.dart';

  class PlotMapScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: buildAppBar(),
        body: MapBody(),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('SELECT YOUR AREA'),
    );
  }
