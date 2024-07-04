import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/widget/password_input_widget.dart';
import 'package:cardri_finance/widget/password_rules_widget.dart';
import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';
import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/screen/set_pin_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nameTextInputType = TextInputType.name;
  final _lastNameTextInputType = TextInputType.text;
  bool errorMessage = false;

  @override
  void dispose() {
    _lastNameController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          errorMessage ? const Color(0xff6C757D) : const Color(0xffF5F2FB),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  width: screenWidth-15,
                  margin: EdgeInsets.only(bottom: keyboardSpace,top: 15),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PasswordInputWidget(
                                passwordController: _nameController,
                                confirmPasswordController: _lastNameController,
                                passwordTextInputType: _nameTextInputType,
                                confirmPasswordTextInputType:
                                    _lastNameTextInputType,
                              ),
                              const PasswordRulesWidget(),
                              NavigationStyle('continue', () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) {
                                    return const SetPinScreen();
                                  }),
                                );
                              }),
                            ],
                          ),
                          if (errorMessage)
                            const ErrorMessageWidget(
                                errortext: 'Invalid Email Address',
                                erroeimage2: 'assets/can.png',
                                erroeimage1: 'assets/er.png'),
                        ],
                      ),
                      const SizedBox(height: 58),
                    ],
                  ),
                ),
              ),
            ),
            const HelpBottomBar(),
          ],
        ),
      ),
    );
  }
}
