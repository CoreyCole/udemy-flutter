import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      RegExp exp = new RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      var valid = exp.hasMatch(email);
      if (valid) {
        sink.add(email);
      } else {
        sink.add('');
        sink.addError('Invalid email address!');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      var valid = password.length >= 6;
      if (valid) {
        sink.add(password);
      } else {
        sink.add('');
        sink.addError('Password must be at least 6 characters long!');
      }
    }
  );
}

