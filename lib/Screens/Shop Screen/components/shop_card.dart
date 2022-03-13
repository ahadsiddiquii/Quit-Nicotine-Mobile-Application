import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../Constant.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 2.h,),
          Container(
            height: 20.h,
            width: 80.w,
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
                      borderRadius: BorderRadius.circular(15) ,
                      child: Image.asset("assets/shop_img2.png", fit: BoxFit.fill,)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 2.w, bottom: 2.w),
                    height: 6.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                      color: kSignupColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 22.sp,),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80.w,
            child: Text("120-day Quit Nicotine 4 Life Programme", style: TextStyle(
                color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w400, height: 2
            ),),
          ),
          Container(
            width: 80.w,
            child: Text("£120.00", style: TextStyle(
                color: kSigninColor, fontSize: 11.sp, fontWeight: FontWeight.w400, height: 1.5
            ),),
          ),
        ],
      ),
    );
  }
}
