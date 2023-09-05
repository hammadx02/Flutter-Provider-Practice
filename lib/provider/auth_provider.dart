// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void Login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);
        print(
          'successful',
        );
      } else {
        setLoading(false);
        print(
          'failed',
        );
      }
    } catch (e) {
      setLoading(false);
      print(
        e.toString(),
      );
    }
  }
}
