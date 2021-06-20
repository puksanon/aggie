import 'package:aggie/router/route.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'AGGIE',
      style: Theme.of(context).textTheme.headline5.copyWith(color: primary),
    ),
    centerTitle: true,
    actions: [
      GestureDetector(
        onTap: () {
          PageRouter.toProfilePage(context);
        },
        child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/image/demo_profile.jpg')),
      ),
      SizedBox(
        width: 16,
      )
    ],
  );
}
