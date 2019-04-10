import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            Container(margin: EdgeInsets.only(top: 16)),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 16)),
            submitButton()
          ],
        )
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'email address (you@example.com)',
        labelText: 'Email *'
      ),
      onSaved: (String value) {
        email = value;
      }
    );
  }

  Widget passwordField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      validator: validatePassword,
      decoration: const InputDecoration(
        icon: Icon(Icons.security),
        hintText: 'must be greater than 6 characters',
        labelText: 'Password *'
      ),
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('email=$email\npassword=$password');
          formKey.currentState.reset();
        }
      }
    );
  }

}

