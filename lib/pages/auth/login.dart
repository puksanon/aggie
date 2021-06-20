import 'package:aggie/pages/auth/components/FormSignIn.dart';
import 'package:aggie/pages/auth/components/FormSignUp.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildTabBar(context),
        body: TabBarView(
          children: [FormSignIn(), FormSignUp()],
        ),
      ),
    );
  }

  AppBar buildTabBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        tabs: [Tab(icon: Text('SIGN IN')), Tab(icon: Text('SIGN UP'))],
      ),
      title: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              'AGGIE',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: primary),
            ),
          ),
        ],
      ),
    );
  }
}
