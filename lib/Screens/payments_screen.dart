import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

import 'Components/backButton.dart';
import 'Home Screens/dash_bord.dart';
import 'welldone_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  TextEditingController c11 = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController expiry = TextEditingController();
  TextEditingController country = TextEditingController();
  String methodSelector = "Card";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        backgroundColor: Colors.white,
        title: Text(
          "Payments",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
        ),
        actions: [
          // Icon(
          //   Icons.more_horiz,
          //   size: 24.sp,
          // ),
          // SizedBox(
          //   width: 5.sp,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashBord()));
              },
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 8.sp,
          ),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Payment for\n1. 120-day Quit Nicotine 4 Life Programme\n2. To include inner health scan\n3. Tissue cells salts\n4. Guide book",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "£220.00",
                style: TextStyle(
                    color: kSigninColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                methodSelector = "Card";
                              });
                            },
                            child: Container(
                              height: 8.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                color: methodSelector == "Card"
                                    ? kSigninColor
                                    : Color(0xff505050),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: kSigninColor, width: 0.8.sp),
                              ),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(right: 50.sp, left: 5.sp),
                                title: Icon(
                                  Icons.payment,
                                  color: Colors.black,
                                ),
                                subtitle: Text(
                                  "Card",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11.sp),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                methodSelector = "Paypal";
                              });
                            },
                            child: Container(
                              height: 8.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                color: methodSelector == "Paypal"
                                    ? kSigninColor
                                    : Color(0xff505050),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: kSigninColor, width: 0.8.sp),
                              ),
                              child: ListTile(
                                // contentPadding: EdgeInsets.only(right: 40.sp, left: 5.sp),
                                title: Container(
                                    margin:
                                        EdgeInsets.only(left: 0.w, right: 13.w),
                                    height: 2.h,
                                    width: 2.w,
                                    child: Image.asset(
                                      "assets/paypale.png",
                                      fit: BoxFit.fill,
                                    )),
                                subtitle: Text(
                                  "Paypal",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11.sp),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: 8.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: Color(0xff505050),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: kSigninColor, width: 0.8.sp),
                              ),
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.black,
                                size: 25.sp,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Card number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 6.5.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c11,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                fillColor: Color(0xff505050),
                                filled: true,
                                hintText: "1234 1234 1234 1234",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300),
                                // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 0.8.sp,
                                      color: kSigninColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: kSigninColor,
                                    width: 0.8.sp,
                                  ),
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
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 3.5.h,
                                  width: 40.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "Expiry",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  height: 6.5.h,
                                  width: 40.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: expiry,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.datetime,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff505050),
                                      filled: true,
                                      hintText: "MM/YY",
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300),
                                      // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 0.8.sp,
                                            color: kSigninColor,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: kSigninColor,
                                          width: 0.8.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 3.5.h,
                                  width: 40.w,
                                  // color: Colors.purple,
                                  child: Text(
                                    "CVV",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Container(
                                  height: 6.5.h,
                                  width: 40.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: cvv,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff505050),
                                      filled: true,
                                      hintText: "CVV",
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300),
                                      // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 0.8.sp,
                                            color: kSigninColor,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: kSigninColor,
                                          width: 0.8.sp,
                                        ),
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
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text(
                              "Country",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            height: 6.5.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              enabled: false,
                              controller: country,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                  fillColor: Color(0xff505050),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 0.8.sp,
                                        color: kSigninColor,
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSigninColor,
                                      width: 0.8.sp,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSigninColor,
                                      width: 0.8.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20.sp,
                                    color: kSigninColor,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 7.h,
                width: 65.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: kSignupColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WellDoneScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
