import 'package:cardri_finance/screen/bvn_verification.dart';
import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/pin_button_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/pin_inputbox_widget.dart';
import 'package:cardri_finance/data/country_data.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  final _inputboxcontroller1 = TextEditingController();
  final _inputboxcontroller2 = TextEditingController();
  final _inputboxcontroller3 = TextEditingController();
  final _inputboxcontroller4 = TextEditingController();

  String? selectedCountry = countries[0].flag;
  String? selectedCode = countries[0].code;
  bool errorMessage = false;

  @override
  void dispose() {
    _inputboxcontroller1.dispose();
    _inputboxcontroller2.dispose();
    _inputboxcontroller3.dispose();
    _inputboxcontroller4.dispose();
    super.dispose();
  }

  void valueFunction(String btnValue) {
    if (_inputboxcontroller1.text.isEmpty) {
      setState(() {
        _inputboxcontroller1.text = btnValue;
      });
    } else if (_inputboxcontroller2.text.isEmpty) {
      setState(() {
        _inputboxcontroller2.text = btnValue;
      });
    } else if (_inputboxcontroller3.text.isEmpty) {
      setState(() {
        _inputboxcontroller3.text = btnValue;
      });
    } else if (_inputboxcontroller4.text.isEmpty) {
      setState(() {
        _inputboxcontroller4.text = btnValue;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BvnVerifictionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor:
          errorMessage ? const Color(0xff6C757D) : const Color(0xffF5F2FB),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: keyboardSpace),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 15),
                                width: 32,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          Text(
                            'Verify Pin',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff1B1B1B),
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Choose a 5-Digit Pin to login in to your account \nsecurely.',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: const Color(0xff474256),
                                ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PinInputBox(controller: _inputboxcontroller1),
                              PinInputBox(controller: _inputboxcontroller2),
                              PinInputBox(controller: _inputboxcontroller3),
                              PinInputBox(controller: _inputboxcontroller4),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Column(
                            children: [
                              buildButtonRow(['1', '2', '3']),
                              const SizedBox(height: 30),
                              buildButtonRow(['4', '5', '6']),
                              const SizedBox(height: 30),
                              buildButtonRow(['7', '8', '9']),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 70),
                                  PinButton(
                                    btntxt: '0',
                                    onPressed: () => valueFunction('0'),
                                  ),
                                  InkWell(
                                    onTap: clearLastInput,
                                    child: Image.asset('assets/cancel.png'),
                                  ),
                                  const SizedBox(width: 45),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 58),
                  ],
                ),
              ),
            ),
            const HelpBottomBar(),
          ],
        ),
      ),
    );
  }

  Row buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons
          .map((btntxt) => PinButton(
                btntxt: btntxt,
                onPressed: () => valueFunction(btntxt),
              ))
          .toList(),
    );
  }

  void clearLastInput() {
    if (_inputboxcontroller4.text.isNotEmpty) {
      setState(() {
        _inputboxcontroller4.clear();
      });
    } else if (_inputboxcontroller3.text.isNotEmpty) {
      setState(() {
        _inputboxcontroller3.clear();
      });
    } else if (_inputboxcontroller2.text.isNotEmpty) {
      setState(() {
        _inputboxcontroller2.clear();
      });
    } else if (_inputboxcontroller1.text.isNotEmpty) {
      setState(() {
        _inputboxcontroller1.clear();
      });
    }
  }
}
