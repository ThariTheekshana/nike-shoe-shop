// screens/register_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike/components/custom_alert_dialog.dart';
import 'package:nike/components/custom_button.dart';
import 'package:nike/components/custom_textfield.dart';
import 'package:nike/helper/helper_function.dart';
import 'package:nike/screens/splash_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // register method
  void registerUser() async {
    // show loading circle
    showDialog(
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF0D6EFD),
              ),
            ),
        context: context);

    // make sure password match
    if (_passwordController.text != _confirmpasswordController.text) {
      // pop loading circle
      Navigator.pop(context);

      // show eror message to user
      CustomAlertDialog(message: "Password don't match!!!");
    }

    // if password do match
    else {
      // try creating the user
      try {
        //create the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        context.go('/home');

        // pop loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        // display error message to user
        displayMessagToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              context.go('/login');
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF7F7F9),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Register Account",
                style: GoogleFonts.raleway(
                    fontSize: 32.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                "Fill your details or continue with \n social media",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF707B81)),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextfield(
              hint: "Enter your name",
              controller: _nameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextfield(
              hint: "Enter your email address",
              controller: _emailController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextfield(
              hint: "Enter your password",
              isPassword: true,
              controller: _passwordController,
            ),
            SizedBox(height: 20.h),
            CustomTextfield(
              hint: "Re - enter your password",
              isPassword: true,
              controller: _confirmpasswordController,
            ),
            SizedBox(height: 40.h),
            Center(
              child: CustomButton(
                  name: "Sign Up",
                  textColor: Colors.white,
                  onTap: registerUser,
                  color: const Color(0xFF0D6EFD)),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomButton(
                  image: Image.asset('assets/images/google.png',
                      width: 24.w, height: 24.h),
                  name: "Sign In With Google",
                  textColor: const Color(0xFF2B2B2B),
                  onTap: () {},
                  color: const Color(0xFFF7F7F9)),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 70.0.w),
              child: Row(
                children: [
                  Text(
                    'Already Have An Account?',
                    style: GoogleFonts.raleway(
                        fontSize: 15.sp,
                        color: const Color(0xFF6A6A6A),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5.h),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.raleway(
                          fontSize: 15.sp,
                          color: const Color(0xFF1A1D1E),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
