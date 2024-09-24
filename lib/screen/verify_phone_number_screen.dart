import 'package:cardri_finance/reusable_custom_widget/backbutton_widegt.dart';
import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';
import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/reusable_custom_widget/pin_inputbox_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({
    // required this.loginid,
    super.key,
  });

  // final String loginid;

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  final _inputboxcontroller1 = TextEditingController();
  final _inputboxcontroller2 = TextEditingController();
  final _inputboxcontroller3 = TextEditingController();
  final _inputboxcontroller4 = TextEditingController();
  final _inputboxcontroller5 = TextEditingController();
  final _enterednumbercontroller = TextEditingController();
  bool errorMessage = false;

  void changePhoneNumber() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Change Phone'),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.cancel_presentation))
            ]
          ),
          // content: const Text('Phone Number'),
          actions: [
            Column(children: [
              TextFieldWidget(
                  controller: _enterednumbercontroller,
                  title: 'Phone Number',
                  labeled: 'Enter your phone number',
                  textInputType: TextInputType.number,
                  textobsure: false),
              const SizedBox(height: 10),
              NavigationStyle('Continue', () {})
            ])
          ]),
    );
  }

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
              padding: EdgeInsets.only(bottom: keyboardspace),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Stack(children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackButtonWidget(),
                          const SizedBox(height: 20),
                          const TitleHeaderWidget(
                              title: 'Verify Phone Number',
                              subtitle:
                                  'A five digits code has been sent to your phone \nnumber +2348060258151, use it to complete your verification.'),
                          const SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PinInputBox(
                                  controller: _inputboxcontroller1,
                                  obscuremode: false,
                                  readonly: false,
                                ),
                                PinInputBox(
                                    controller: _inputboxcontroller2,
                                    obscuremode: false,
                                    readonly: false),
                                PinInputBox(
                                    controller: _inputboxcontroller3,
                                    obscuremode: false,
                                    readonly: false),
                                PinInputBox(
                                    controller: _inputboxcontroller4,
                                    obscuremode: false,
                                    readonly: false),
                                PinInputBox(
                                    controller: _inputboxcontroller5,
                                    obscuremode: false,
                                    readonly: false),
                              ]),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: changePhoneNumber,
                            child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.phone_android),
                                  SizedBox(width: 8),
                                  Text('change phone'),
                                ]),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "Didn't Receive OTP? ",
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Resend',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ]),
                            ),
                          )
                        ]),
                    if (errorMessage)
                      const ErrorMessageWidget(
                          errortext: '', erroeimage2: '', erroeimage1: '')
                  ]),
                ),
                const SizedBox(height: 58),
              ]),
            ),
          ),
          const HelpBottomBar(),
        ]),
      ),
    );
  }
}
