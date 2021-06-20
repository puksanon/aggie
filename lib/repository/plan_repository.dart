import 'dart:convert';
import 'dart:io';

import 'package:aggie/constant.dart';
import 'package:aggie/utils/StorageManager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:location/location.dart';

class PlanRepo {
  final http.Client httpClient = http.Client();
  final Uri _getPlanListUrl = Uri.parse('$apiEndpoint/map/plan');
  final Uri _createPlan = Uri.parse('$apiEndpoint/map/plan');
  Uri _getPlanById(String id) => Uri.parse('$apiEndpoint/map/plan/$id');

  Future<http.Response> getPlanList() async {
    final token = await StorageManager.readData('token');
    try {
      if (token != null) {
        return await httpClient.get(this._getPlanListUrl,
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> getPlanById(String planId) async {
    final token = await StorageManager.readData('token');
    try {
      if (token != null) {
        return await httpClient.get(this._getPlanById(planId),
            headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> cretePlan(
      String planName, String address, LatLng location) async {
    Map<String, dynamic> reqBody = {
      'plan_name': planName,
      'location': <String, dynamic>{
        'lat': location.latitude,
        'lng': location.longitude
      },
      'address': address
    };
    final token = await StorageManager.readData('token');
    try {
      if (token != null) {
        return await httpClient.post(this._createPlan,
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
              HttpHeaders.contentTypeHeader: 'application/json'
            },
            body: jsonEncode(reqBody));
      }
    } catch (e) {
      print(e);
    }
  }
}
