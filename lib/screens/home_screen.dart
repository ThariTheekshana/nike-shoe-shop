// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/screens/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {},
                  ),
                  Text(
                    "Hellooo",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 18.sp, color: Colors.black)),
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
