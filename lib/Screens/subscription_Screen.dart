import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

import 'Components/bullet_list.dart';
import 'payments_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Subscription",
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: [
          Icon(
            Icons.more_horiz,
            size: 24.sp,
          ),
          SizedBox(
            width: 5.sp,
          ),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Container(
                child: Image.asset("assets/gift_box.png"),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                child: Text(
                  "This 120-day programme is designed to assist you with quitting nicotine for good, whilst reducing feelings of anxiety, depression and cravings usually associated with this process. But it also helps you to build yourself back up with strong foundations, to be able to resist going back into a mind state of addiction. As smoking is a habit. And not an addiction.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      height: 1.2,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  height: 34.h,
                  decoration: BoxDecoration(
                    // color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: 1.4.sp, color: kSigninColor),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Upon subscribing you will get,",
                        style: TextStyle(
                            color: kSigninColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp),
                      ),
                      BulletList([
                        '120 days supply of Herbal Smoking Mix to mix as added to your own tobacco.',
                        '120 days supply of Tissue Salts to take daily to ease the cravings.',
                        'The prepaid envelope for the Hair Test4 Life and the instructions on how to do it',
                        'The explanation of how the programme works. And how to use it.',
                      ]),
                    ],
                  )),
              SizedBox(
                height: 2.h,
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
                        builder: (context) => PaymentsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Subscribe Now",
                    style: TextStyle(
                        color: Colors.white,
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
