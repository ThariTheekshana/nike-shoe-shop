// components/bottom_nav_two.dart
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike/components/bottom_nav.dart';

class BottomNavTwo extends StatefulWidget {
  const BottomNavTwo({super.key});

  @override
  State<BottomNavTwo> createState() => _BottomNavTwoState();
}

class _BottomNavTwoState extends State<BottomNavTwo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          CustomPaint(
            painter: BottomNavPainter(),
            child: Container(
              height: 80.h,
            ),
          ),
          Center(
            heightFactor: 0.5,
            child: FloatingActionButton(
              onPressed: () {
                context.go('/cart');
              },
              backgroundColor: Color(0xFF0D6EFD),
              child: Icon(FontAwesomeIcons.bagShopping, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(FeatherIcons.home, color: Colors.black54),
                  onPressed: () {
                    context.go('/home');
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.heart, color: Colors.black54),
                  onPressed: () {
                    context.go('/favorite');
                  },
                ),
                SizedBox(width: 60.w),
                IconButton(
                  icon: Icon(FeatherIcons.bell, color: Colors.black54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FeatherIcons.user, color: Colors.black54),
                  onPressed: () {
                    context.go('/profile');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
