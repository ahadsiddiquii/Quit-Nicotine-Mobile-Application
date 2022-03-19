import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/User.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);

Future<void> loginViaGoogle(BuildContext context) async {
  User user = User(email: ' ', first_name: " ", last_name: " ");
  print('Google login done1');
  try {
    await _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
      print('Google login done1.5');

      user =
          User(email: acc!.email, first_name: acc.displayName!, last_name: " ");

      Map<String, dynamic> googleLoginCreds = {
        "email": acc.email,
        "first_name": acc.displayName,
        "last_name": " ",
      };

      // socialLoginFirestoreService(googleLoginCreds, context);
      // print(acc?.id);
      // print(acc?.email);
      // print(acc?.displayName);
      // print(acc?.photoUrl);

      // user.email = acc.email;
      // user.name = acc.displayName;
      // user.image = acc.photoUrl;
    });
  } catch (e) {
    print("Thrown Exception");
    print(e.toString());
  }
}

Future<void> loginViaFacebook() async {
  // User user = User();
  try {
    final FacebookAuth _facebookAuth = FacebookAuth.instance;
    final LoginResult result = await _facebookAuth.login();

    // print("login start");
    // final LoginResult result = await FacebookAuth.login();
    // print("login start 2");
    // if (result.status == LoginStatus.success) {
    //   // you are logged
    //   final AccessToken accessToken = result.accessToken!;
    //   // print(accessToken);
    //   // print(accessToken.token);

    //   // print(accessToken);
    //   // print(accessToken.token);
    //   // print(accessToken.expires);
    //   // print(accessToken.grantedPermissions);
    //   // print(accessToken.userId);
    //   // print(accessToken.isExpired);

    //   final token = accessToken.token;

    //   final url = Uri.parse(
    //       'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=$token');

    //   /// for profile details also use the below code
    //   final graphResponse = await http.get(url);
    //   // final profile = json.decode(graphResponse.body);
    //   // print(profile);
    //   // print(profile['picture']['data']['url']);

    //   // user.email = profile['email'];
    //   // user.name = profile['name'];
    //   // user.image = profile['picture']['data']['url'];
    //   // print(user.image);

    // } else {
    //   print("Login Failed");
    // }
  } catch (e) {
    print("Error in login via facebook");
    print(e.toString());
    throw Exception(e.toString());
  }
  // print('FB login done');
  // return user;
}

  // final res = await widget.plugin.expressLogin();
  // if (res.status == FacebookLoginStatus.success) {
  //   await _updateLoginInfo();
  // } else {
  //   await showDialog<Object>(
  //     context: context,
  //     builder: (context) => const AlertDialog(
  //       content: Text("Can't make express log in. Try regular log in."),
  //     ),
  //   );
  // }
  // var facebookLoginResult =
  //     await facebookLogin.logInWithReadPermissions(['email']);
  // switch (facebookLoginResult.status) {
  //   case FacebookLoginStatus.error:
  //     print("Error");
  //     // onLoginStatusChanged(false);
  //     break;
  //   case FacebookLoginStatus.cancelledByUser:
  //     print("CancelledByUser");
  //     // onLoginStatusChanged(false);
  //     break;
  //   case FacebookLoginStatus.loggedIn:
  //     print("LoggedIn");
  //     // onLoginStatusChanged(true);
  //     break;
  // }

