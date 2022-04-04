import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Screens/Home%20Screens/dash_bord.dart';
import 'package:sizer/sizer.dart';

import '../blocs/User/user_bloc.dart';
import '../utils/local_storage.dart';
import 'login_screen.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  void initState() {
    print("Startup initstate");
    super.initState();
    initialize().then((e) {
      print("Startup initstate2");
      print(Storage.getValue("userId"));
      BlocProvider.of<UserBloc>(context).add(CheckIfLoggedIn());
      setState(() {});
    });
  }

  initialize() async {
    await Storage.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserInitial) {
          print("User initial");
          Timer(Duration(milliseconds: 3000), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          });
        } else if (state is UserLoggedIn) {
          print("Inside user logged in");

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => DashBord()));
        } else if (state is UserSplashScreen) {
          print("Showing Splash Screen");
        }
      },
      child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Color.fromRGBO(24, 25, 26, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/1235.png',
                          ),
                          fit: BoxFit.fitWidth),
                    ))),
            Center(
                child: Container(
                    width: 60.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('assets/Quitnicotine1.png'),
                          fit: BoxFit.fitWidth),
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Black is the new Red 4 Green to get yourself clean',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Evertone two',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  height: 1.2,
                ),
              ),
            ),
          ])),
    ));
  }
}
