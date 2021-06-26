import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Plan extends Equatable {
  final String planId;
  final String planName;
  final LatLng location;
  final String address;
  final String unit;
  final String hydro;
  final String soil;
  final String gwav;

  Plan(
      {this.address,
      this.planName,
      this.location,
      this.planId,
      this.unit,
      this.hydro,
      this.gwav,
      this.soil});

  factory Plan.fromJson(Map<String, dynamic> json) {
    print(json['plan_id']);
    return Plan(
        planId: json['plan_id'],
        planName: json['plan_name'],
        location: LatLng(json['location']['lat'], json['location']['lng']),
        address: json['address'],
        unit: json['unit'],
        gwav: json['gwavUnit'].toString().isNotEmpty
            ? json['gwavUnit']
            : 'ไม่มีข้อมูล',
        hydro: json['hidoUnit'].toString().isNotEmpty
            ? json['hidoUnit']
            : 'ไม่มีข้อมูล',
        soil: json['soilUnit'].toString().isNotEmpty
            ? json['soilUnit']
            : 'ไม่มีข้อมูล');
  }

  @override
  List<Object> get props => [planId, location, planName, address, unit];
}
