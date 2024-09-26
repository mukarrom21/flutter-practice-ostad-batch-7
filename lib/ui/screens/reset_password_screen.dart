import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:practice_with_ostad/ui/screens/sign_in_screen.dart';
import 'package:practice_with_ostad/ui/utils/app_colors.dart';
import 'package:practice_with_ostad/ui/widgets/background_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreen(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 85,
              ),

              /// Title Section
              Text(
                'Set Password',
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Your password must be at least 6 characters long with a mix of letters and numbers.',
                style: textTheme.titleMedium,
              ),
              const SizedBox(
                height: 30,
              ),

              /// Sign in form
              _buildSignInForm(),

              const SizedBox(
                height: 28,
              ),

              /// Forgot Password and Sign Up section
              _buildSignUpSection(textTheme),
            ],
          ),
        ),
      ),
    );
  }

  /// Build the sign in form
  Widget _buildSignInForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: "Confirm Password",
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: _onClickConfirmButton,
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  /// Build the sign up section
  Widget _buildSignUpSection(TextTheme textTheme) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Have account? ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: ' Sign in',
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.themeColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = _onClickHaveAccountSignIn,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickConfirmButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (_) => false,
    );
  }

  void _onClickHaveAccountSignIn() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (_) => false,
    );
  }
}