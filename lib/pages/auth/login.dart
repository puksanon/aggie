import 'package:aggie/pages/auth/components/FormSignIn.dart';
import 'package:aggie/pages/auth/components/FormSignUp.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildTabBar(),
          body: TabBarView(
            children: [
              FormSignIn(),
              FormSignUp()
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildTabBar() {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Text('SIGN IN')),
          Tab(icon: Text('SIGN UP'))
        ],
      ),
      title: Text('AGGIE'),
    );
  }
}