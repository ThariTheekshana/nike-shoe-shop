// views/intro_screens/intro_page3.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/routers/router.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D6EFD),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 200.0.w),
              child: SvgPicture.asset(
                'assets/images/smile.svg',
                width: 80.w,
                height: 70.h,
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/shoe03png.png',
                  width: 370.w,
                  height: 280.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 30.w),
                  child: Image.asset(
                    'assets/images/circleO.png',
                    width: 300.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/nikebogpng.png',
                    width: 380.w,
                    height: 220.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 70.w,
                  child: Text(
                    "You Have the \nPower To",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFECECEC),
                    ),
                  ),
                ),
                Positioned(
                  top: 140.h,
                  left: 20.w,
                  child: Text(
                    "There Are Many Beautiful And Attractive \nPlants To Your Room",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFECECEC),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // CustomButton(
            //   name: "Next",
            //   onTap: () {
            //     context.go('/home');
            //   },
            // ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
