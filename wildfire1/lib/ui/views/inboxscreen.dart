import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wildfire1/ui/views/searchbar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(top: 22.h),
            child: CloseButton(color: Colors.black),
          ),
          elevation: 0,
          toolbarHeight: 79.h,
          title: Padding(
            padding: EdgeInsets.only(top: 25.h, right: 16.w),
            child: Text(
              "Inbox",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body:Column(
            children: [
        Padding(
        padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
      child: Container(
        height: 38.h,
        width: double.infinity,
        child: SearchBar(),
      ),
    ),]
        )
    );
  }
}
