// components/shoe_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/provider/cart_provider.dart';
import 'package:nike/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class ShoeTile extends StatefulWidget {
  final int index;
  final String imagePath;
  final String textOne;
  final String textTwo;
  final double price;
  final bool showAddButton;

  const ShoeTile({
    super.key,
    required this.index,
    required this.imagePath,
    required this.textOne,
    required this.textTwo,
    required this.price,
    this.showAddButton = true,
  });

  @override
  State<ShoeTile> createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  bool isFavorite = false;
  bool iscart = false;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    isFavorite = favoriteProvider.favorites
        .any((item) => item['imagePath'] == widget.imagePath);

    iscart =
        cartProvider.cart.any((item) => item['imagePath'] == widget.imagePath);

    return Stack(
      children: [
        Container(
          width: 150,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print(
                      "Favorite button clicked for item index: ${widget.index}");
                  favoriteProvider.toggleFavorite({
                    'imagePath': widget.imagePath,
                    'textOne': widget.textOne,
                    'textTwo': widget.textTwo,
                    'price': widget.price
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 100, top: 10),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
              Image.asset(
                widget.imagePath,
                width: 180,
                height: 80,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.textOne,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue)),
                    Text(widget.textTwo,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                    SizedBox(height: 10),
                    Text('\$${widget.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
        if (widget.showAddButton)
          Positioned(
            top: 155,
            left: 115,
            child: GestureDetector(
              onTap: () {
                print(
                    "Favorite button clicked for item index: ${widget.index}");
                cartProvider.toggleCart({
                  'imagePath': widget.imagePath,
                  'textOne': widget.textOne,
                  'textTwo': widget.textTwo,
                  'price': widget.price
                });
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        if (widget.showAddButton == false)
          Positioned(
            top: 139.h,
            left: 100,
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == 0 || widget.index == 1
                        ? Colors.red
                        : Colors.yellow,
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.index == 0 || widget.index == 1
                        ? Color(0xFF2256B9)
                        : Color(0xFF7DDBDA),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
