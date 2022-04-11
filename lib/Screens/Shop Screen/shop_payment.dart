import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Screens/Components/backButton.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';
import '../../models/ShopItem.dart';
import 'components/payment_form.dart';
import 'components/shop_card.dart';
import 'purchase_successful.dart';

class ShopPayment extends StatefulWidget {
  final ShopItem shopItem;
  ShopPayment({required this.shopItem, Key? key}) : super(key: key);

  @override
  _ShopPaymentState createState() => _ShopPaymentState();
}

class _ShopPaymentState extends State<ShopPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: backButton(context),
        // Padding(
        //   padding: EdgeInsets.only(left: 5.sp),
        //   child: Container(
        //     margin: EdgeInsets.only(
        //         top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child: Builder(
        //       builder: (context) => IconButton(
        //         onPressed: () => Navigator.pop(context),
        //         icon: Icon(
        //           Icons.arrow_back_ios_rounded,
        //           size: 12.sp,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        title: Text(
          "Payment",
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
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
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            // height: 20.h,
                            // width: 100.w,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 3.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  widget.shopItem.image,
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 90.w,
                      child: Text(
                        widget.shopItem.itemName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 2),
                      ),
                    ),
                    Container(
                      // width: 80.w,
                      child: Text(
                        "£ ${widget.shopItem.amount}",
                        style: TextStyle(
                            color: kSigninColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              PaymentForm(),
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
                        builder: (context) => PurchaseSuccessful(),
                      ),
                    );
                  },
                  child: Text(
                    "Pay £ ${widget.shopItem.amount}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
