import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/Screens/signup_screen.dart';
import 'package:sizer/sizer.dart';

import '../resources/providers/LoginProvider.dart';
import 'Home Screens/dash_bord.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureShow = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 20.h,
                width: 50.w,
                // color: Colors.grey,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/Vector1.png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Container(
                          height: 11.h,
                          width: 30.w,
                          child: Image.asset(
                            "assets/logo.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Color(0xff599E48),
                      fontSize: 22.sp,
                      fontFamily: "MaskFilter",
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 80.w,
                            // color: Colors.purple,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.symmetric(horizontal: 5.w),
                            // color: Colors.pink,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                              controller: email,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // validator: ,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xff599E48),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff599E48),
                                    // color: Color(0xfff4b41a),
                                  ),
                                ),
                                suffixIcon: Icon(
                                  Icons.check,
                                  color: Color(0xff599E48),
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xff599E48),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 80.w,
                            // color: Colors.purple,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              controller: password,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              obscureText: obscureShow,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Color(0xff599E48),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xff599E48),
                                    // color: Color(0xfff4b41a),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      obscureShow = !obscureShow;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color(0xff599E48),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xff599E48),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 8.h,
                width: 90.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: kSigninColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBord(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3.h),
                child: Text(
                  "Or Login with",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kSigninColor, width: 1.sp)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () {
                    loginViaGoogle(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 4.h,
                        width: 8.w,
                        child: Image.asset(
                          "assets/google.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Google",
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kSigninColor, width: 1.sp)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () {
                    loginViaFacebook();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 5.h,
                        width: 10.w,
                        child: Image.asset(
                          "assets/fb.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'If you don’t have an account? ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: kSigninColor)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
