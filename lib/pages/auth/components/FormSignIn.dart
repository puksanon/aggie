import 'package:aggie/bloc/user/user_cubit.dart';
import 'package:aggie/router/route.dart';
import 'package:aggie/theme/design_token.dart';
import 'package:aggie/widgets/CTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class JsonSerializable {
  const JsonSerializable();
}

class FormSignIn extends StatefulWidget {
  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  handleSignIn() async {
    final userCubit = Provider.of<UserCubit>(context, listen: false);
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      final res = await userCubit.signIn(email.text, password.text);
      if (res != null) PageRouter.redirectToHome(context);
    }
    // PageRouter.redirectToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserCubit>(context).state;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 24,
            ),
            CTextField(
              controller: email,
              hintText: 'Email',
            ),
            SizedBox(
              height: 16,
            ),
            CTextField(
              obstacle: true,
              controller: password,
              hintText: 'Password',
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(20)),
              child: userState is UserSingingIn
                  ? SpinKitRing(
                      color: Colors.white,
                      size: 30,
                      lineWidth: 4,
                    )
                  : TextButton(
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: white),
                      )),
                      onPressed: handleSignIn,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
