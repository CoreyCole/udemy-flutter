import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Container(margin: EdgeInsets.only(top: 16)),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 16)),
          submitButton(bloc)
        ],
      )
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) { // re-runs build function every time the stream emits a new value
        return TextField(
          onChanged: bloc.changeEmail,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'email address (you@example.com)',
            labelText: 'Email',
            errorText: snapshot.error
          )
        );
      }
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.security),
            hintText: 'must be greater than 6 characters',
            labelText: 'Password',
            errorText: snapshot.error
          )
        );
      }
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Logins'),
          color: Colors.blue,
          onPressed: !snapshot.hasData || snapshot.hasError || snapshot.data == false
            ? null
            : bloc.submit
        );
      }
    );
  }
}

