// views/intro_screens/intro_page2.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/routers/router.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D6EFD),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Image.asset(
                    'assets/images/rightpng.png',
                    height: 95.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 148.0.w),
                  child: SvgPicture.asset('assets/images/smile.svg'),
                )
              ],
            ),
            Image.asset(
              'assets/images/shoe2ong.png',
              width: 320.w,
              height: 235.h,
              fit: BoxFit.cover,
            ),
            Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/nikebogpng.png',
                    width: 370.w,
                    height: 220.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 35.w,
                  child: Text(
                    "Let’s Start Journey \nWith Nike",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFECECEC),
                    ),
                  ),
                ),
                Positioned(
                  top: 120.h,
                  left: 40.w,
                  child: Text(
                    "Smart, Gorgeous & Fashionable \nCollection Explore Now",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontSize: 18.sp,
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
            //     context.go('/intro3');
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
