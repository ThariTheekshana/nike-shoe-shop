// screens/details_screen.dart
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_appBar.dart';

class ShoeDetailPage extends StatefulWidget {
  final String textTwo;
  final double price;
  final String imagePath;

  const ShoeDetailPage({
    super.key,
    required this.textTwo,
    required this.price,
    required this.imagePath,
  });

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Sneaker Shop',
          rightWidget: IconButton(
            icon: const Icon(FontAwesomeIcons.heart, color: Colors.black),
            onPressed: () {}, // should pass this into favorite
          ),
          leftIcon: Icons.arrow_back_ios,
          onLeftIconPressed: () => Navigator.pop(context)),
      backgroundColor: const Color(0xFFF7F7F9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(widget.textTwo,
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold))),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 20.0.w),
          //   child: Text("Men's Shoes"),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text('\$${widget.price.toString()}',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF707B81)))),
          ),
          Hero(
            tag: 'shoeImage',
            child: Image.asset(
              widget.imagePath,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Text(
              "The Max Air 270 unit delivers unrivaled, all-day comfort. The sleek, running-inspired design roots you to everything Nike........",
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707B81)),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Read More",
                  style: TextStyle(
                      color: Color(0xFF0D6EFD), fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: Color(0xFFD9D9D9),
                  ),
                  child: IconButton(
                    icon:
                        const Icon(FontAwesomeIcons.heart, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    width: 210.w,
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.bagShopping, color: Colors.white),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Color(0xFF0D6EFD)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
