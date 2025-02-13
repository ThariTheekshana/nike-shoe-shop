// screens/favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike/components/bottom_nav.dart';
import 'package:nike/components/bottom_nav_two.dart';
import 'package:nike/components/custom_appBar.dart';
import 'package:nike/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../components/shoe_tile.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = favoriteProvider.favorites;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorite',
        rightWidget: IconButton(
          icon: const Icon(FontAwesomeIcons.heart, color: Colors.black),
          onPressed: () {},
        ),
        leftIcon: Icons.arrow_back_ios,
        onLeftIconPressed: () => context.go('/home'),
      ),
      backgroundColor: const Color(0xFFF7F7F9),
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: favoriteItems.isEmpty
                ? Center(
                    child: Text("No favorites yet!",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 40.0.w, top: 20.h),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: favoriteItems.length,
                      itemBuilder: (context, index) {
                        final shoe = favoriteItems[index];
                        return ShoeTile(
                          index: index,
                          imagePath: shoe['imagePath'],
                          textOne: shoe['textOne'],
                          textTwo: shoe['textTwo'],
                          price: shoe['price'],
                          showAddButton: false,
                        );
                      },
                    ),
                  ),
          ),
          const BottomNavTwo(),
        ],
      ),
    );
  }
}
