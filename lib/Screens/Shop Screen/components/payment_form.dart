import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../Constant.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}
TextEditingController c11 = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      // width: 100.w,
      color: Colors.black,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 8.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: Color(0xff505050),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: kSigninColor, width: 0.8.sp),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.only(right: 50.sp, left: 5.sp),
                              title: Icon(Icons.payment, color: Colors.white,),
                              subtitle: Text("Card", style: TextStyle(color: Colors.white, fontSize: 11.sp),),
                            ),
                          ),
                          Container(
                            height: 8.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              color: Color(0xff505050),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: kSigninColor, width: 0.8.sp),
                            ),
                            child: ListTile(
                              // contentPadding: EdgeInsets.only(right: 40.sp, left: 5.sp),
                              title: Container(
                                  margin: EdgeInsets.only(left: 0.w, right: 13.w),
                                  height: 2.h,
                                  width: 2.w,
                                  child: Image.asset("assets/paypale.png", fit: BoxFit.fill,)),
                              subtitle: Text("Paypal", style: TextStyle(color: Colors.white, fontSize: 11.sp),),
                            ),
                          ),
                          Container(
                              height: 8.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: Color(0xff505050),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: kSigninColor, width: 0.8.sp),
                              ),
                              child: Icon(Icons.more_horiz, color: Colors.white, size: 25.sp,)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("Card number", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 6.5.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c11,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: ,
                              decoration: InputDecoration(
                                fillColor: Color(0xff505050),
                                filled: true,
                                hintText: "1234 1234 1234 1234",
                                hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 0.8.sp,
                                      color: kSigninColor,
                                    )
                                ),
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
                    SizedBox(height: 2.h,),
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
                                  child: Text("Expiry", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.sp),) ,
                                ),
                                Container(
                                  height: 6.5.h,
                                  width: 40.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: c11,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.datetime,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff505050),
                                      filled: true,
                                      hintText: "MM/YY",
                                      hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                      // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 0.8.sp,
                                            color: kSigninColor,
                                          )
                                      ),
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
                                  child: Text("CVC", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.sp),) ,
                                ),
                                Container(
                                  height: 6.5.h,
                                  width: 40.w,
                                  // margin: EdgeInsets.only(top: 5.sp),
                                  // color: Colors.pink,
                                  child: TextFormField(
                                    controller: c11,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    // validator: ,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xff505050),
                                      filled: true,
                                      hintText: "CVV",
                                      hintStyle: TextStyle(color: Colors.white70, fontSize: 12.sp, fontWeight: FontWeight.w300),
                                      // contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 0.8.sp,
                                            color: kSigninColor,
                                          )
                                      ),
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
                    SizedBox(height: 2.h,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("Country", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 6.5.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c11,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
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
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: kSigninColor,
                                      width: 0.8.sp,
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp, color: kSigninColor,)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 3.5.h,
                            width: 90.w,
                            // color: Colors.purple,
                            child: Text("Zip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.sp),) ,
                          ),
                          Container(
                            height: 6.5.h,
                            width: 90.w,
                            // margin: EdgeInsets.only(top: 5.sp),
                            // color: Colors.pink,
                            child: TextFormField(
                              controller: c11,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
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
                                    )
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
