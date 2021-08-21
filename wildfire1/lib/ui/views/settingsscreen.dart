import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 22.h),
          child: BackButton( color: Colors.black ),
        ),
        elevation: 0,
        toolbarHeight: 79.h,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h, right: 16.w),
          child: Text(
            "Settings",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(255, 98, 77, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 50.h, left: 40.w, right: 30.w),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.add_alert),
                SizedBox(width: 15.w,),
                Text("Notifications", style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black), textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              children: [
                Icon(Icons.storage),
                SizedBox(width: 15.w,),
                Text("Storage", style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black), textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              children: [
                Icon(Icons.help),
                SizedBox(width: 15.w,),
                Text("Help", style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black), textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              children: [
                Icon(Icons.emoji_people),
                SizedBox(width: 15.w,),
                Text("Invite a Friend", style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black), textAlign: TextAlign.left,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
