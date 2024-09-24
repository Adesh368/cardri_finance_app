import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:cardri_finance/screen/verify_phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({super.key});

  @override
  State<AccountVerificationScreen> createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  bool errorMessage = false;
  bool containerHighlight1 = false;
  bool containerHighlight2 = false;
  bool elevatedButtonColor = false;

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          errorMessage ? const Color(0xff6C757D) : const Color(0xffF5F2FB),
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenWidth - 15,
                margin: EdgeInsets.only(bottom: keyboardSpace, top: 15),
                child: Column(children: [
                  Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleHeaderWidget(
                            title: 'Account Verification',
                            subtitle:
                                'Please verify your detail with either phone number or \nemail address.'),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              containerHighlight1 = true;
                              containerHighlight2 = false;
                              elevatedButtonColor = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(
                                    width: 1,
                                    color: containerHighlight1
                                        ? const Color(0xffEFD1DC)
                                        : const Color(0xffffffff)),
                                borderRadius: BorderRadius.circular(14)),
                            child: const Row(children: [
                              Icon(
                                Icons.message,
                                color: Color(0xffD70D4A),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone Number (SMS)'),
                                  Text('+2349*******78')
                                ],
                              )
                            ]),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              containerHighlight1 = false;
                              containerHighlight2 = true;
                              elevatedButtonColor = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                border: Border.all(
                                    width: 1,
                                    color: containerHighlight2
                                        ? const Color(0xffEFD1DC)
                                        : const Color(0xffffffff)),
                                borderRadius: BorderRadius.circular(14)),
                            child: const Row(children: [
                              Icon(
                                Icons.email,
                                color: Color(0xffD70D4A),
                              ),
                              SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email Verification'),
                                    Text('user@eamail.com')
                                  ])
                            ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) {
                                  return const VerifyPhoneNumberScreen();
                                }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 14),
                              backgroundColor:elevatedButtonColor? const Color(0xffD70D4A) : const Color(0xffEA125D),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('Continue'),
                          ),
                        )
                      ],
                    ),
                    if (errorMessage)
                      const ErrorMessageWidget(
                          errortext: 'Invalid Email Address',
                          erroeimage2: 'assets/can.png',
                          erroeimage1: 'assets/er.png'),
                  ]),
                  const SizedBox(height: 58),
                ]),
              ),
            ),
          ),
          const HelpBottomBar(),
        ]),
      ),
    );
  }
}
