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
    const SizeBox = SizedBox(height: 24,);

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizeBox,
            TextFormField(
              autofocus:  true,
              maxLength: 50,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.person),
                hintText: 'Your email address',
                labelText: 'Email',
              ),
              onChanged: (value) {

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

              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }else if (value.length < 8 ){
                  return 'Password less 8 character';
                }
                return null;
              },
            ),
            SizeBox,
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.lock),
                  labelText: 'Confirm Password',
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

              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }else if (value.length < 8 ){
                  return 'Password less 8 character';
                }
                return null;
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
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
