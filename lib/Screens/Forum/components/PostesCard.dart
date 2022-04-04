import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Constant.dart';
import 'package:nicotine/blocs/Forum/forum_bloc.dart';
import 'package:nicotine/blocs/User/user_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../models/Post.dart';
import '../post_detail_screen.dart';

class PostesCard extends StatefulWidget {
  final Post thisPost;
  const PostesCard({required this.thisPost, Key? key}) : super(key: key);

  @override
  State<PostesCard> createState() => _PostesCardState();
}

class _PostesCardState extends State<PostesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(thisPost: widget.thisPost),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
        width: 94.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              // color: Colors.black,
              // width: 80.w,
              child: ListTile(
                leading: Container(
                  height: 6.h,
                  width: 12.w,
                  // margin: EdgeInsets.only(top: 7),
                  decoration: BoxDecoration(
                    color: Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.thisPost.user!.userImage!,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  widget.thisPost.user!.userName!,
                  // "Jason Momoa",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      height: 1.4),
                ),
                subtitle: Text(
                  "Posted by ${widget.thisPost.user!.userEmail!}",
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      height: 1.4),
                ),
              ),
            ),
            Container(
              width: 85.w,
              child: Text(
                widget.thisPost.postDescription!,
                // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(
                    color: Colors.black, fontSize: 11.sp, height: 1.4),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 22.h,
              width: 85.w,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.thisPost.postImage!,
                  // "assets/Mask.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1.5.h,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 0.5.sp, color: Colors.grey.shade300),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final userState =
                            BlocProvider.of<UserBloc>(context).state;
                        if (userState is UserLoggedIn) {
                          // BlocProvider.of<ForumBloc>(context).add(LikeAPost(
                          //     user: userState.user, post: widget.thisPost));
                        }
                      },
                      child: Container(
                        height: 3.h,
                        width: 6.w,
                        child: Image.network(
                          "https://png.pngitem.com/pimgs/s/165-1658491_youtube-like-button-like-button-youtube-png-transparent.png",
                          fit: BoxFit.contain,
                        ),
                        // Image.asset(
                        //   "assets/Facebook Like.png",
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                    Text(
                      "  ${widget.thisPost.postLikes!.length.toString()}",
                      // "4,341",
                      style: TextStyle(
                        color: kLightColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.sms_outlined,
                      size: 22.sp,
                      color: kLightColor,
                    ),
                    Text(
                      "  ${widget.thisPost.postComments!.length.toString()}",
                      // "341",
                      style: TextStyle(
                        color: kLightColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.share_rounded,
                      color: kLightColor,
                      size: 22.sp,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 5.h,
              margin: EdgeInsets.only(left: 5.w, bottom: 1.h),
              child: TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Write Comment",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 10.sp),
                  // contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
