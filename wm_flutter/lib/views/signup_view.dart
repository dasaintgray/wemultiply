import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/bloc/auth/auth_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/core/utils/crypto_utils.dart';

class SignupView extends StatelessWidget {
  final Client client = SpcCore.client;
  final SessionManager sessionManager = SpcCore.sessionManager;
  final authController = EmailAuthController(SpcCore.client.modules.auth);
  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // SignInWithEmailButton(caller: client.modules.auth),
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userNameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: SingleChildScrollView(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const CircularProgressIndicator.adaptive().center(),
                );
              }

              if (state is AuthenticatedSuccess) {
                Navigator.of(context).pop(); // close loading dialog
                showSnackbar(context, "Registration successful!");
                // Navigator.of(context).pushReplacementNamed('/home');
              }

              if (state is AuthError) {
                Navigator.of(context).pop(); // close loading dialog
                showSnackbar(context, state.errorMessage);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: loadAssetImage(CoreConstant.logoWithText),
                ),
                SizedBox(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextTitle,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryTextInfo,
                    ),
                    hintText: 'weMultiply_user1',
                  ),
                ),
                SizedBox(height: 2.h),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.primaryTextInfo,
                    ),
                    hintText: userNameController.text.isEmpty
                        ? 'wemultiplymobile@gmail.com'
                        : '${userNameController.text}@gmail.com',
                  ),
                ),
                SizedBox(height: 2.h),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.password,
                      color: AppColors.primaryTextInfo,
                    ),
                    suffixIcon: Icon(Icons.visibility),
                    hintText: CryptoUtils.generatePassword(length: 8),
                  ),
                ),
                SizedBox(height: 5.h),
                ElevatedButton(
                  onPressed: () async {
                    final username = userNameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (username.isEmpty || email.isEmpty || password.isEmpty) {
                      showSnackbar(context, "Please fill in all the fields");
                      return;
                    }

                    context.read<AuthBloc>().add(
                      AccountRequest(
                        username: username,
                        email: email,
                        password: password,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.lightBackground,
                    backgroundColor: AppColors.darkGreen,
                    minimumSize: const Size(100, 50),
                    elevation: 1,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
