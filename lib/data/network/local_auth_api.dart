import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'scan fingerprintto authenticate',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
