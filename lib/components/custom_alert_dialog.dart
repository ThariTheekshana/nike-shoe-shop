// components/custom_alert_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final bool showImage; // Optional parameter to control image visibility
  final String? imagePath; // Optional parameter for the image path

  const CustomAlertDialog({
    Key? key,
    required this.message,
    this.showImage = false, // Default is false (no image)
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Adjust the size to fit the content
        children: [
          if (showImage && imagePath != null) ...[
            // Circle container with the image inside
            Container(
              width: 40.w, // Circle diameter
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFF0D6EFD), // Circle background color
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Padding inside the circle
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h), // Space between the image and the text
          ],
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black, // Text color
                fontSize: 18.sp,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            width: 70.w,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF0D6EFD), // Button background color
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500, // Text style for the button
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}