import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../Constant.dart';
import '../../../models/ShopItem.dart';

class ShopCard extends StatelessWidget {
  final ShopItem shopItem;
  ShopCard({required this.shopItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 25.h,
            width: 85.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
              color: Color(0xffE1DADC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Container(
                  // height: 20.h,
                  // width: 100.w,
                  width: 85.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        shopItem.image,
                        // "assets/Mask/.png",
                        fit: BoxFit.contain,
                      )),
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
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80.w,
            child: Text(
              shopItem.itemName
              // "120-day Quit Nicotine 4 Life Programme"
              ,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 2),
            ),
          ),
          Container(
            width: 80.w,
            child: Text(
              "£ ${shopItem.amount.toString()}",
              // "£120.00",
              style: TextStyle(
                  color: kSigninColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
