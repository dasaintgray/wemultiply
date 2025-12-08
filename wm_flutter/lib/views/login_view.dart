import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/views/payment_view.dart';

class LoginView extends StatelessWidget {
  final Client clientCaller = SpcCore.client;
  final SessionManager sessionManager = SpcCore.sessionManager;
  final authController = EmailAuthController(SpcCore.client.modules.auth);
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // final emailController = TextEditingController();
    // final passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 5.h),
            SizedBox(
              height: 25.h,
              child: loadAssetImage(CoreConstant.logoWithText),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              height: 10.h,
              child: Column(
                children: [
                  Text(
                    'Welcome to weMultiply',
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please sign-in to continue',
                    style: TextStyle(
                      color: AppColors.darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SignInWithEmailButton(
                minPasswordLength: 8,
                caller: clientCaller.modules.auth,
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.teal, // Change background color
                  // foregroundColor: Colors.white, // Change text color
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ), // Change padding
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ), // Change font style
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Change shape
                  ),
                ),
                onSignedIn: () {
                  log('User Sign In');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentView(orderId: '1', amount: 100),
                    ),
                  );
                },
              ),
            ),
            // TextField(
            //   controller: emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: 12),
            // TextField(
            //   controller: passwordController,
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // SizedBox(
            //   height: 3.h,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Login'),
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // SizedBox(
            //   height: 20.h,
            //   child: Column(
            //     children: [
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Forgot Password?',
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Text("Don't have an account?"),
            //           TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (_) => SignupView(),
            //                 ),
            //               );
            //             },
            //             child: Text(
            //               'Sign Up',
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (sessionManager.isSignedIn) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('User is Signed In')),
            //       );
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('No user is currently signed in')),
            //       );
            //     }
            //   },
            //   child: const Text('Check User is SignIn or SignOut'),
            // ),
          ],
        ).paddingAll(24.sp),
      ),
    );
  }
}
