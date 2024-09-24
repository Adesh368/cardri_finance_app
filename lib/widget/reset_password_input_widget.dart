import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';

class ResetPasswordInputWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextInputType passwordTextInputType;
  final TextInputType confirmPasswordTextInputType;

  const ResetPasswordInputWidget({super.key, 
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordTextInputType,
    required this.confirmPasswordTextInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleHeaderWidget(title: 'Reset Password', subtitle: 'Create a new password'),
        const SizedBox(height: 15),
        TextFieldWidget(
          image: Image.asset('assets/eyetrue.png'),
          image1: Image.asset('assets/eyefalse.png'),
          controller: passwordController,
          title: 'New Password',
          labeled: '*******',
          textInputType: passwordTextInputType,
          textobsure: false,
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          image: Image.asset('assets/eyetrue.png'),
          image1: Image.asset('assets/eyefalse.png'),
          controller: confirmPasswordController,
          title: 'Confirm Password',
          labeled: 'Enter password',
          textInputType: confirmPasswordTextInputType,
          textobsure: false,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
