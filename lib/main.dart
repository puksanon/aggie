import 'package:aggie/bloc/plan/plan_cubit.dart';
import 'package:aggie/bloc/plan_detail/plan_detail_cubit.dart';
import 'package:aggie/bloc/user/user_cubit.dart';
import 'package:aggie/pages/auth/login.dart';
import 'package:aggie/pages/myapp.dart';
import 'package:aggie/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:aggie/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => UserCubit()),
      BlocProvider(create: (_) => PlanCubit()),
      BlocProvider(create: (_) => PlanDetailCubit())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGGIE',
      theme: ThemeManager().getTheme(),
      home: MainPage(),
    );
  }
}
