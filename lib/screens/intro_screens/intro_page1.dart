// screens/intro_screens/intro_page1.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/routers/router.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D6EFD),
      body: SafeArea(
        child: Column(
          
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.w, top: 20.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 60.0.h),
                    child: SvgPicture.asset(
                      'assets/images/sun.svg',
                    ),
                  ),
                  Text(
                    'WELCOME TO \nNIKE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/spiral.svg',
              width: 55.w,
              height: 15.h,
            ),

            // Adding legii.png and blueNike.svg
            Stack(
              clipBehavior: Clip.none, 
              children: [
                Image.asset(
                  'assets/images/onboard-removebg.png',
                  width: 600.w,
                  height: 400.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 280.h, 
                  child: Image.asset(
                    'assets/images/nikebogpng.png',
                    width: 380.w,
                    height: 200.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
