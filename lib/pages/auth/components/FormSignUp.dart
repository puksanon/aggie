import 'package:aggie/theme/design_token.dart';
import 'package:aggie/widgets/CTextField.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    const SizeBox = SizedBox(
      height: 24,
    );

    return Container(
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
            hintText: 'Username*',
          ),
          SizedBox(
            height: 16,
          ),
          CTextField(
            hintText: 'Password*',
          ),
          SizedBox(
            height: 16,
          ),
          CTextField(
            hintText: 'Confirm Password*',
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              child: Center(
                  child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: white),
              )),
              onPressed: () => {},
            ),
          )
        ],
      ),
    );
  }
}
