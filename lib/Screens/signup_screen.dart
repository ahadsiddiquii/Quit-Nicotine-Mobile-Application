import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../Constant.dart';
import 'discription_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
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
                height: 18.h,
                width: 40.w,
                // color: Colors.grey,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/Vector.png",
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
              // SizedBox(height: 1.h,),
              Container(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: kSignupColor,
                      fontSize: 22.sp,
                      fontFamily: "MaskFilter",
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 1.h,
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
                              "Enter your name",
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
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              controller: name,
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
                                  borderSide: BorderSide(color: kSignupColor),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: kSignupColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.h,
                            width: 80.w,
                            // color: Colors.purple,
                            child: Text(
                              "Enter your email",
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
                                  borderSide: BorderSide(color: kSignupColor),
                                ),
                                suffixIcon: Icon(
                                  Icons.check,
                                  color: kSignupColor,
                                ),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: kSignupColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
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
                                      color: kSignupColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: kSignupColor,
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
                                    color: kSignupColor,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: kSignupColor,
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
                height: 7.h,
                width: 90.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: kSignupColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiscriptionScreen()));
                    }
                  },
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                child: Text(
                  "Or Sign Up with",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
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
                    border: Border.all(color: kSignupColor, width: 1.sp)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () {},
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
                    border: Border.all(color: kSignupColor, width: 1.sp)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () {},
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
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'You have an account? ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: kSignupColor)),
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
