import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

class LoginController {
  final authAcontroller = AuthController();
  Future<void> googleSingIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authAcontroller.setUser(context, response);
      print(response);
    } catch (error) {
      authAcontroller.setUser(context, null);
      print(error);
    }
  }
}
