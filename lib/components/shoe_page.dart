// components/shoe_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/shoe_tile.dart';
import 'package:nike/screens/details_screen.dart';

class ShoeCategoryPage extends StatefulWidget {
  const ShoeCategoryPage({super.key});

  @override
  State<ShoeCategoryPage> createState() => _ShoeCategoryPageState();
}

class _ShoeCategoryPageState extends State<ShoeCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Shoes",
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2B2B2B))),
              ),
              Text(
                "See all",
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0D6EFD))),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeDetailPage(
                                textTwo: 'Nike Jordan',
                                price: 302.00,
                                imagePath: 'assets/images/bigshoe.png')));
                  },
                  child: Hero(
                    tag: 'shoeImage',
                    child: const ShoeTile(
                      index: 0,
                      imagePath: 'assets/images/bigshoe.png',
                      textOne: 'BEST SELLER',
                      textTwo: 'Nike Jordan',
                      price: 302.00,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeDetailPage(
                                  textTwo: 'Nike Air Max',
                                  price: 752.00,
                                  imagePath: 'assets/images/bigshoe2.png',
                                )));
                  },
                  child: const ShoeTile(
                    index: 1,
                    imagePath: 'assets/images/bigshoe2.png',
                    textOne: 'BEST SELLER',
                    textTwo: 'Nike Air Max',
                    price: 752.00,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeDetailPage(
                                  textTwo: 'Nike Club Max',
                                  price: 47.70,
                                  imagePath: 'assets/images/bigshoe3.png',
                                )));
                  },
                  child: const ShoeTile(
                    index: 2,
                    imagePath: 'assets/images/bigshoe3.png',
                    textOne: 'BEST SELLER',
                    textTwo: 'Nike Club Max',
                    price: 47.70,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeDetailPage(
                                  textTwo: 'Nike Air Max',
                                  price: 57.60,
                                  imagePath: 'assets/images/bigshoe4.png',
                                )));
                  },
                  child: const ShoeTile(
                    index: 3,
                    imagePath: 'assets/images/bigshoe4.png',
                    textOne: 'BEST SELLER',
                    textTwo: 'Nike Air Max',
                    price: 57.60,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals",
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2B2B2B))),
              ),
              Text(
                "See all",
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0D6EFD))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: -20.h,
              left: MediaQuery.of(context).size.width * 0.46,
              child: Image.asset(
                'assets/images/new_nike.png',
                width: 120.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: -20.h,
              left: MediaQuery.of(context).size.width * 0.46,
              child: Image.asset(
                'assets/images/new_nike.png',
                width: 120.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: -20.h,
              left: MediaQuery.of(context).size.width * 0.46,
              child: Image.asset(
                'assets/images/new_nike.png',
                width: 120.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20.h,
              left: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assets/images/star.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 75.h,
              left: MediaQuery.of(context).size.width * 0.53,
              child: Image.asset(
                'assets/images/shadow.png',
                width: 120.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 75.h,
              left: MediaQuery.of(context).size.width * 0.54,
              child: Image.asset(
                'assets/images/shadow.png',
                width: 120.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10.h,
              left: MediaQuery.of(context).size.width * 0.43,
              child: Image.asset(
                'assets/images/new.png',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10.h,
              left: MediaQuery.of(context).size.width * 0.43,
              child: Image.asset(
                'assets/images/new.png',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10.h,
              left: MediaQuery.of(context).size.width * 0.43,
              child: Image.asset(
                'assets/images/new.png',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5.h,
              left: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(
                'assets/images/star.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 75.h,
              left: MediaQuery.of(context).size.width * 0.35,
              child: Image.asset(
                'assets/images/star.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 75.h,
              left: MediaQuery.of(context).size.width * 0.02,
              child: Image.asset(
                'assets/images/star.png',
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 15.h,
                left: MediaQuery.of(context).size.width * 0.02,
                child: Text("Summer Sale",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF3B3B3B))))),
            Positioned(
                top: 30.h,
                left: MediaQuery.of(context).size.width * 0.02,
                child: Text("15% OFF",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF674DC5))))),
          ],
        ),
      ],
    );
  }
}
