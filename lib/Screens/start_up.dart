import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {

  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 3000),(){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));}
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
        body: Container(
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
            ])));
  }
}