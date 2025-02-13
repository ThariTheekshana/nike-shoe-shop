// screens/checkout_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_appBar.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String userEmail = 'Loading..';
  String userPhone = 'Loading..';

  @override
  void initState() {
    fetchUserDetails();
    super.initState();
  }

  void fetchUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? 'No Email';
      });
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        userPhone = userDoc["phoneNumber"] ?? "No Phone Number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cart;

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F9),
      appBar: CustomAppBar(
        title: 'My Cart',
        rightWidget: IconButton(
          icon: const Icon(FontAwesomeIcons.bagShopping, color: Colors.black),
          onPressed: () {},
        ),
        leftIcon: Icons.arrow_back_ios,
        onLeftIconPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Expanded(
              flex: 12,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w, top: 10.h),
                      child: Text(
                        "Contact Information",
                        style: GoogleFonts.raleway(
                            color: Color(0xFF1A2530),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Container(
                              child: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xFFF8F9FA),
                              )),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userEmail,
                              style: GoogleFonts.poppins(
                                  color: Color(0xFF1A2530),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Email",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF707B81),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 210.w,
                                ),
                                Icon(
                                  FeatherIcons.edit,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20.0.h),
                        //   child: Icon(FeatherIcons.edit),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Container(
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 18.sp,
                                color: Colors.black,
                              ),
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xFFF8F9FA),
                              )),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userPhone,
                              style: GoogleFonts.poppins(
                                  color: Color(0xFF1A2530),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Phone",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF707B81),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 207.w,
                                ),
                                Icon(
                                  FeatherIcons.edit,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20.0.h, left: 90.w),
                        //   child: Icon(FeatherIcons.edit),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.sp),
                      child: Text(
                        "Address",
                        style: GoogleFonts.raleway(
                            color: Color(0xFF1A2530),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Text(
                            'Subtotal',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF707B81)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0.w),
                          child: Text(
                            '\$${cartProvider.getTotalPriceAllShoes().toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1A2530)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Text(
                            'Delivery',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF707B81)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0.w),
                          child: Text(
                            '\$${cartProvider.calculateDeliveryFee(cartProvider.getTotalPriceAllShoes()).toString()}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1A2530)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.w, left: 20.w),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: Text(
                            'Total Cost',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2B2B2B)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0.w),
                          child: Text(
                            '\$${cartProvider.calculateTotalCostWithDelivery().toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0D6EFD)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        name: "Checkout",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutScreen()));
                        },
                        color: Color(0xFF0D6EFD),
                        textColor: Colors.white)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
