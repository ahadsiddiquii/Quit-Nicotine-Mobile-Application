import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/Constant.dart';
import 'package:sizer/sizer.dart';

import 'components/shop_card.dart';
import 'shop_payment.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
        title: Text("Shop", style: TextStyle(fontSize: 16.sp),),
        actions: [
          Icon(Icons.more_horiz, size: 24.sp,),
          SizedBox(width: 5.sp,),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPayment()),);
                  },
                  child: ShopCard(),
              );
            }
        ),
      ),
    );
  }
}

