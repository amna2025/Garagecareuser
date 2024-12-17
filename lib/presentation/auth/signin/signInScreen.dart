import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/signin_providers.dart';
import 'package:garagecare/presentation/auth/signin/components/divider_with_text.dart';
import 'package:garagecare/presentation/auth/signin/components/input_fields.dart';
import 'package:garagecare/presentation/auth/signin/components/logo_widget.dart';
import 'package:garagecare/presentation/auth/signin/components/remember_me_and_forgot_password.dart';
import 'package:garagecare/presentation/auth/signin/components/sign_in_button.dart';
import 'package:garagecare/presentation/auth/signin/components/sign_in_prompt.dart';
import 'package:garagecare/presentation/auth/signin/components/social_media_buttons.dart';


class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(signInProvider.notifier).clearEmailOrUsernameError();
      ref.read(signInProvider.notifier).clearPasswordError();
    });
  }

  Future<bool> _onWillPop() async {
    ref.read(signInProvider.notifier).clearEmailOrUsernameError();
    ref.read(signInProvider.notifier).clearPasswordError();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(signInProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04),
                LogoWidget(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                Text("Login to your account", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.06,
                  color: Colors.black,
                )),
                SizedBox(height: screenHeight * 0.03),
                InputFields(viewModel, screenWidth, screenHeight, context),
                SizedBox(height: screenHeight * 0.02),
                RememberMeAndForgotPassword(viewModel, context),
                SizedBox(height: screenHeight * 0.03),
                SignInButton(viewModel, screenHeight, screenWidth, context),
                SizedBox(height: screenHeight * 0.03),
                DividerWithText(context),
                SizedBox(height: screenHeight * 0.03),
                SocialMediaButtons(screenWidth),
                SizedBox(height: screenHeight * 0.02),
                SignInPrompt(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
