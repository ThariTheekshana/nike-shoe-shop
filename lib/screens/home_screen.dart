// screens/home_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/bottom_nav_two.dart';
import 'package:nike/components/shoe_page.dart';
import 'package:nike/screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedTabIndex = 0;


void fetchUserName() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    DocumentSnapshot userDoc = 
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    if (userDoc.exists) {
      String userName = userDoc['name'];
      print("Current User Name: $userName");
    } else {
      print("User document does not exist.");
    }
  } else {
    print("No user is currently logged in.");
  }
}

  @override
  void initState() {
    super.initState();
     fetchUserName();
    _tabController = TabController(length: 3, vsync: this);
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> _categories = [
    "All Shoes",
    "Outdoor",
    "Tennis",
    "Gym",
    "Casual"
  ];

  final List<Widget> _categoryContents = [
    ShoeCategoryPage(),
    ShoeCategoryPage(),
    ShoeCategoryPage(),
    ShoeCategoryPage(),
    ShoeCategoryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Explore.png'),
        backgroundColor: Color(0xFFF7F7F9),
        iconTheme: IconThemeData(color: Colors.black, size: 25.sp),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0.w),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 25.sp,
                ),
              ))
        ],
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Color(0xFFF7F7F9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, top: 20.h),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Icon(
                          Icons.search_sharp,
                          size: 30.sp,
                          color: Color(0xFF6A6A6A),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Looking for shoes',
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: Color(0xFF6A6A6A),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  width: 280.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Icon(
                    Icons.format_align_center_outlined,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: Color(0xFF0D6EFD)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(right: 200.0.w),
            child: Text(
              "Select Category",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B))),
            ),
          ),
          SizedBox(height: 15.h),

          // tab bar
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _categories.length,
                  (index) {
                    final bool isSelected = index == _selectedTabIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Container(
                          width: 100.w,
                          height: 38.h,
                          // margin: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Color(0xFF0D6EFD) : Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                        color:
                                            Color(0xFF0D6EFD).withOpacity(0.5),
                                        blurRadius: 5)
                                  ]
                                : [],
                          ),
                          alignment: Alignment.center,
                          child: Text(_categories[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // tab content
          Expanded(
            flex: 10,
            child: Center(
              child: _categoryContents[_selectedTabIndex],
            ),
          ),

          // bottom nav bar
          // Replace the placeholder bottom navigation bar
          BottomNavTwo()
        ],
      ),
    );
  }
}
