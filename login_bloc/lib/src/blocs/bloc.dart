import 'dart:core';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream
    .debounce(Duration(seconds: 3))
    .transform(validateEmail);
  Stream<String> get password => _password.stream
    .debounce(Duration(seconds: 3))
    .transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (String e, String p) {
    var valid = (e != null && e.isNotEmpty)
                && (p != null && p.isNotEmpty);
    print('$e && $p = $valid');
    return valid;
  });

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _email.value;
    print('final values: $validEmail && $validPassword');
    changeEmail('');
    changePassword('');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

