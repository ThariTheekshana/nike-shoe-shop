// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/bottom_nav_two.dart';
import 'package:nike/components/custom_appBar.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/provider/cart_provider.dart';
import 'package:nike/screens/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cart;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Cart',
        rightWidget: IconButton(
          icon: const Icon(FontAwesomeIcons.bagShopping, color: Colors.black),
          onPressed: () {},
        ),
        leftIcon: Icons.arrow_back_ios,
        onLeftIconPressed: () => context.go('/home'),
      ),
      backgroundColor: const Color(0xFFF7F7F9),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Row(
              children: [
                Text(
                  '${cartItems.length} ${cartItems.length == 1 ? "Item" : "Items"}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A2530)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            
            flex: 12,
            child: cartItems.isEmpty
                ? Center(
                    child: Text(
                      "No items in cart!",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w, vertical: 10.h),
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final shoe = cartItems[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Slidable(
                            key: ValueKey(index),
                            startActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.w, right: 10.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0D6EFD),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cartProvider
                                                  .increaseQuantity(index);
                                            },
                                            child: Icon(Icons.add,
                                                color: Colors.white, size: 24),
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                              (cartProvider.cart[index]
                                                          ['quantity'] ??
                                                      1)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 8.h),
                                          GestureDetector(
                                            onTap: () {
                                              cartProvider
                                                  .decreaseQuantity(index);
                                            },
                                            child: Icon(Icons.remove,
                                                color: Colors.white, size: 24),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 5.w, left: 10.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF1900),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20.h, horizontal: 10.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          cartProvider.removeFromCart(index);
                                        },
                                        child: Icon(Icons.delete,
                                            color: Colors.white, size: 24.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0.w),
                                      child: Container(
                                        width: 120.w,
                                        height: 90.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          color: Color(0xFFF7F7F9),
                                        ),
                                        child: Image.asset(
                                          shoe['imagePath'],
                                          width: 100.w,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5.h),
                                            Text(
                                              shoe['textTwo'],
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF1A2530)),
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "\$${cartProvider.getTotalPriceEachShoe(index).toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          cartItems.isNotEmpty
              ? Expanded(
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
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
