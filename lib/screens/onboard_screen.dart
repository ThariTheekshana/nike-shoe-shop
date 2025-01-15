// screens/onboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/screens/intro_screens/intro_page1.dart';
import 'package:nike/screens/intro_screens/intro_page2.dart';
import 'package:nike/screens/intro_screens/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // controller to keep track of which page in now
  final PageController _controller = PageController();

  // keep track if we are on first page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // page view
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 620.0.h),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotColor: const Color(0xFFFFB21A),
                      activeDotColor: const Color(0xFFFFFFFF),
                      dotHeight: 8.h,
                      dotWidth: 25.w,
                      expansionFactor: 2,
                      spacing: 10,
                      strokeWidth: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),

                // get started
                onLastPage
                    ? CustomButton(
                        textColor: const Color(0xFF2B2B2B),
                        color: const Color(0xFFECECEC),
                        name: "Get Started",
                        onTap: () {
                          context.go('/login');
                          _controller.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn);
                        })
                    : CustomButton(
                        textColor: const Color(0xFF2B2B2B),
                        color: const Color(0xFFECECEC),
                        name: "Next",
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn);
                        }),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
