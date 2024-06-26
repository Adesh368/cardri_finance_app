import 'package:cardri_finance/data/country_data.dart';
import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/widget/country_selector_overlay.dart';
import 'package:cardri_finance/widget/personal_details_form.dart';
import 'package:flutter/material.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _namecontroller = TextEditingController();
  final _nametextinputtype = TextInputType.name;
  final _emailcontroller = TextEditingController();
  final _emailtextinputtype = TextInputType.emailAddress;
  final _lastnamecontroller = TextEditingController();
  final _lastnametextinputtype = TextInputType.text;
  final _numbercontroller = TextEditingController();
  final _numbertextinputtype = TextInputType.number;
  String? selectedCountry = countries[0].flag;
  String? selectedCode = countries[0].code;
  bool errorMessage = false;

  void selectCountry(int index) {
    setState(() {
      selectedCode = countries[index].code;
      selectedCountry = countries[index].flag;
    });
  }

  @override
  void dispose() {
    _lastnamecontroller.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _numbercontroller.dispose();
    super.dispose();
  }

  void openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => CountrySelectorOverlay(
        selectCountry: selectCountry,
        //selectedCountry: selectedCountry,
        //selectedCode: selectedCode,
      ),
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
                  child: Stack(
                    children: [
                      PersonalDetailsForm(
                        nameController: _namecontroller,
                        lastNameController: _lastnamecontroller,
                        emailController: _emailcontroller,
                        numberController: _numbercontroller,
                        nametextinputtype: _nametextinputtype,
                        lastnametextinputtype: _lastnametextinputtype,
                        emailtextinputtype: _emailtextinputtype,
                        numbertextinputtype: _numbertextinputtype,
                        selectedCountry: selectedCountry,
                        selectedCode: selectedCode,
                        openAddExpenseOverlay: openAddExpenseOverlay,
                      ),
                      if (errorMessage)
                        const ErrorMessageWidget(
                            errortext: 'Invalid Email Address',
                            erroeimage2: 'assets/can.png',
                            erroeimage1: 'assets/er.png'),
                    ],
                  ),
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
