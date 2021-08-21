import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable/expandable.dart';
import 'package:wildfire1/utils/loremipsum.dart';
import 'dart:math' as math;

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: Padding(
        padding: EdgeInsets.only(top: 22.h),
        child: BackButton( color: Colors.black ),
      ),
      elevation: 0,
      toolbarHeight: 79.h,
      title: Padding(
        padding: EdgeInsets.only(top: 25.h, right: 16.w),
        child: Text(
          "Frequently Asked Questions",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
    ),
    backgroundColor: Color.fromRGBO(8, 146, 133, 1),
    body: Padding(
      padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children:[ExpandableNotifier(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[ ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: ExpandableThemeData(
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                ),
                collapsed: Container(child: Text("How does Fire Tracker work?", style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),),),
                expanded:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("How does Fire Tracker work?", style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black), textAlign: TextAlign.left,),
                      Text(loremIpsum, style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black), softWrap: true,),]
                ),
              ),

            ),
            ],
            ),
        ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("Does Fire Tracker allow users to customize notifications for specific locations?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("Does Fire Tracker allow users to customize notifications for specific locations?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("What are the benefits of these alerts?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("What are the benefits of these alerts?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("What other languages is Fire Tracker available in?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("What other languages is Fire Tracker available in?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("How reliable is Fire Tracker?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("How reliable is Fire Tracker?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("How can I receive more information about wild fire warnings and related resources?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("How can I receive more information about wild fire warnings and related resources?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          ExpandableNotifier(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                    ),
                    collapsed: Container(child: Text("My app is not showing my location correctly, how can I update it?", style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),),),
                    expanded:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text("My app is not showing my location correctly, how can I update it?", style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black), textAlign: TextAlign.left,),
                          Text(loremIpsum, style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black), softWrap: true,),]
                    ),
                  ),

                ),
              ],
            ),
          ),],
      ),
    ),
    );
  }
}
