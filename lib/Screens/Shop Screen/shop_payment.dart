import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constant.dart';
import 'components/payment_form.dart';
import 'components/shop_card.dart';
import 'purchase_successful.dart';

class ShopPayment extends StatefulWidget {
  const ShopPayment({Key? key}) : super(key: key);

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
        leading: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: Container(
            margin: EdgeInsets.only(top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child:  Builder(builder: (context) =>  IconButton(
              onPressed: ()=> Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_rounded, size: 12.sp,),
            ),),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text("Payment", style: TextStyle(fontSize: 16.sp),),
        actions: [
          Icon(Icons.more_horiz, size: 24.sp,),
          SizedBox(width: 5.sp,),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
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
                      height: 13.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: Color(0xffE1DADC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            // height: 20.h,
                            // width: 100.w,
                            decoration: BoxDecoration(
                              color: Color(0xffE1DADC),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/shop_img2.png",
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // width: 80.w,
                      child: Text(
                        "120-day Quit Nicotine 4 Life Programme",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w400,
                            height: 2),
                      ),
                    ),
                    Container(
                      // width: 80.w,
                      child: Text(
                        "£120.00",
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
              SizedBox(height: 2.h,),
              Container(
                height: 7.h,
                width: 65.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: kSignupColor,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseSuccessful(),),);
                  },
                  child: Text("Pay £120.00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
