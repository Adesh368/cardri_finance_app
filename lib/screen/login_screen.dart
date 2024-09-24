import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';
import 'package:cardri_finance/widget/personal_login_details_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool errorMessage = false;
  
  @override
  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor:
          errorMessage ? const Color(0xff6C757D) : const Color(0xffF5F2FB),
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: keyboardspace, left: 15, right: 15, top: 15),
              child: Stack(children: [
                PersonalLoginDetailsForm(
                    emailController: emailController,
                    passwordcontroller: passwordcontroller),
                if (errorMessage)
                  const ErrorMessageWidget(
                      errortext: 'Invalid Email Address',
                      erroeimage2: 'assets/can.png',
                      erroeimage1: 'assets/er.png'),
              ]),
            ),
          ),
          const HelpBottomBar(),
        ]),
      ),
    );
  }
}
