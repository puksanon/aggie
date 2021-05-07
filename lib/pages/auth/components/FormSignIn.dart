import 'package:aggie/pages/plot_map/map_plot_screen.dart';
import 'package:flutter/material.dart';

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
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    const SizeBox = SizedBox(
      height: 24,
    );

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizeBox,
            TextFormField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.person),
                hintText: 'Your email address',
                labelText: 'Email',
              ),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizeBox,
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.lock),
                  hintText: 'Your password',
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      })),
              maxLength: 15,
              obscureText: _isObscure,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 8) {
                  return 'Password less 8 character';
                }
                return null;
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlotMapScreen()));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
