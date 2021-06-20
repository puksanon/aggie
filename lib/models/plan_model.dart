import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Plan extends Equatable {
  final String planId;
  final String planName;
  final LatLng location;
  final String address;
  final String unit;

  Plan({this.address, this.planName, this.location, this.planId, this.unit});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
        planId: json['plan_id'],
        planName: json['plan_name'],
        location: LatLng(json['location']['lat'], json['location']['lng']),
        address: json['address'],
        unit: json['unit']);
  }

  @override
  List<Object> get props => [planId, location, planName, address, unit];
}
