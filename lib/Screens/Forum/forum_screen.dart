import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicotine/Screens/Components/dialog_box.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/Forum/forum_bloc.dart';
import '../../models/User.dart';
import 'components/PostesCard.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPosts();
  }

  getAllPosts() {
    BlocProvider.of<ForumBloc>(context).add(GetAllForumPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: Container(
            margin: EdgeInsets.only(
                top: 1.4.h, bottom: 1.4.h, left: 2.w, right: 2.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 12.sp,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Forum",
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                learnMoreDialogBox(
                    context: context,
                    heading: 'Create a Post',
                    content: 'Do you want to create a post?',
                    function: () {
                      print("creating a post");
                      BlocProvider.of<ForumBloc>(context).add(CreateAPost(
                          user: User(
                              userId: "ajsdkjdlkjaljlk_hassan@gmail.com",
                              userEmail: "hassan2@gmail.com",
                              userName: "Hassan Hassannew",
                              userPassword: "asdasdasd12.",
                              userImage:
                                  "https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80",
                              userPoints: 0,
                              userMistakes: [],
                              userQuestionsAsked: false),
                          postDescription:
                              "Welcome to beautiful scenery in the woods",
                          postImage:
                              "https://images.unsplash.com/photo-1592743263126-bb241ee76ac7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXRpZnVsJTIwc2NlbmVyeXxlbnwwfHwwfHw%3D&w=1000&q=80"));
                      Navigator.of(context).pop();
                    });
              },
              child: Icon(
                Icons.more_horiz,
                size: 24.sp,
              )),
          SizedBox(
            width: 5.sp,
          ),
        ],
      ),
      body: BlocConsumer<ForumBloc, ForumState>(
        listener: (context, state) {
          if (state is PostAdded) {
            getAllPosts();
          }
        },
        builder: (context, state) {
          if (state is AllPostsRetrieved) {
            return Container(
              height: 100.h,
              width: 100.w,
              color: Colors.black,
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPayment()),);
                      },
                      child: PostesCard(
                        thisPost: state.posts[index],
                      ),
                    );
                  }),
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}
