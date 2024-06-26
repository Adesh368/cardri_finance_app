import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';

class PasswordInputWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextInputType passwordTextInputType;
  final TextInputType confirmPasswordTextInputType;

  const PasswordInputWidget({super.key, 
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
        Text(
          'Create Password',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1B1B1B),
              ),
        ),
        const SizedBox(height: 5),
        Text(
          'Create a new password',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xff474256),
              ),
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          image: Image.asset('assets/eyetrue.png'),
          image1: Image.asset('assets/eyefalse.png'),
          controller: passwordController,
          title: 'Password',
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
