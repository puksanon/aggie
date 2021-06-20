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
      if (res != null)
        PageRouter.redirectToHome(context);
      else {
        final userState = Provider.of<UserCubit>(context, listen: false).state;
        if (userState is UserSingInError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(_getErrorSnackBar(userState.message));
        }
      }
    }
    // PageRouter.redirectToHome(context);
  }

  SnackBar _getErrorSnackBar(String message) {
    return SnackBar(
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text('   $message'),
      duration: const Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserCubit>(context).state;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Email',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            CTextField(
              controller: email,
              hintText: 'Email',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Password',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            CTextField(
              obstacle: true,
              controller: password,
              hintText: 'Password',
            ),
            SizedBox(
              height: 32,
            ),
            Center(
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
