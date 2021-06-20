import 'package:aggie/bloc/user/user_cubit.dart';
import 'package:aggie/pages/auth/login.dart';
import 'package:aggie/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) =>
            userState is UserSingedIn ? HomePage() : LoginScreen());
  }
}
