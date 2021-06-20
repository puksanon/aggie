import 'package:aggie/models/plan_model.dart';
import 'package:aggie/pages/auth/login.dart';
import 'package:aggie/pages/home/home.dart';
import 'package:aggie/pages/map_detail_page/plan_detail.dart';
import 'package:aggie/pages/map_detail_page/post_map.dart';
import 'package:aggie/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageRouter {
  static toHomePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  static toProfilePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  static goToPostPage(BuildContext context, LatLng location, String address) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostMapPage(
                  location: location,
                  address: address,
                )));
  }

  static goToPlanDetailPage(BuildContext context, Plan plan) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlanDetailPage(
                  plan: plan,
                )));
  }

  static redirectToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  static redirectToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (route) => false,
    );
  }
}
