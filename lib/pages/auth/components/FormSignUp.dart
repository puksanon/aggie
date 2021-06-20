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

class FormSignUp extends StatefulWidget {
  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();

  handleSignUp() async {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        pass.text.isNotEmpty &&
        pass.text == conPass.text) {
      final res = await Provider.of<UserCubit>(context, listen: false)
          .signUp(email.text, pass.text, name.text);
      if (res != null)
        PageRouter.redirectToHome(context);
      else
        ScaffoldMessenger.of(context).showSnackBar(_getErrorSnackBar(
            (Provider.of<UserCubit>(context, listen: false).state
                    as UserSingUpError)
                .message));
    }
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
    return SingleChildScrollView(
      child: Container(
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
              'Name',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            CTextField(
              hintText: 'Name*',
              controller: name,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Email',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            CTextField(
              hintText: 'Email*',
              controller: email,
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
              hintText: 'Password*',
              controller: pass,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Confirm Password',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 8,
            ),
            CTextField(
              obstacle: true,
              hintText: 'Confirm Password*',
              controller: conPass,
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
                child: userState is UserSingingUp || userState is UserSingingIn
                    ? SpinKitRing(
                        color: Colors.white,
                        size: 30,
                        lineWidth: 4,
                      )
                    : TextButton(
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: white),
                        )),
                        onPressed: handleSignUp,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
