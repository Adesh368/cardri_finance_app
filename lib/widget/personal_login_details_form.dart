import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:cardri_finance/screen/account_verification_screen.dart';
import 'package:cardri_finance/screen/reset_password_screen.dart';
import 'package:cardri_finance/screen/sign_up.dart';
import 'package:cardri_finance/screen/verify_phone_number_screen.dart';
import 'package:flutter/material.dart';

class PersonalLoginDetailsForm extends StatelessWidget {
  const PersonalLoginDetailsForm(
      {required this.emailController,
      required this.passwordcontroller,
      super.key});

  final TextEditingController emailController;
  final TextEditingController passwordcontroller;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const TitleHeaderWidget(
          title: 'Hi Adeeyo,',
          subtitle: 'Safely login to your Cardri account.'),
      const SizedBox(height: 40),
      TextFieldWidget(
          controller: emailController,
          title: 'Email or Phone Number',
          labeled: 'Enter your email or phone number',
          textInputType: TextInputType.text,
          textobsure: false),
      const SizedBox(height: 15),
      TextFieldWidget(
          image: Image.asset('assets/eyetrue.png'),
          image1: Image.asset('assets/eyefalse.png'),
          textobsure: true,
          controller: passwordcontroller,
          title: 'Password',
          labeled: 'Enter Password',
          textInputType: TextInputType.text),
      const SizedBox(height: 15),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text('Forgot password? ',
            style: Theme.of(context).textTheme.bodySmall!),
        InkWell(
          onTap: () {
             Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) {
            return const ResetPasswordScreen();
          }),
        );
          },
          child: Text(
            'Reset',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color(0xffD70D4A),
                ),
          ),
        ),
      ]),
      const SizedBox(height: 20),
      NavigationStyle('Login', () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) {
            return const AccountVerificationScreen();
          }),
        );
      }),
      const SizedBox(height: 20),
      Center(
          child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) {
              return const SignUpScreen();
            }),
          );
        },
        child: Text(
          'Create a new account',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xff211054),
              ),
        ),
      ))
    ]);
  }
}
