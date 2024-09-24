import 'package:cardri_finance/reusable_custom_widget/backbutton_widegt.dart';
import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:cardri_finance/screen/create_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';

class PersonalDetailsForm extends StatelessWidget {
  const PersonalDetailsForm({
    super.key,
    required this.nameController,
    required this.lastNameController,
    required this.emailController,
    required this.numberController,
    required this.nametextinputtype,
    required this.lastnametextinputtype,
    required this.emailtextinputtype,
    required this.numbertextinputtype,
    required this.selectedCountry,
    required this.selectedCode,
    required this.openAddExpenseOverlay,
  });

  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController numberController;
  final TextInputType nametextinputtype;
  final TextInputType lastnametextinputtype;
  final TextInputType emailtextinputtype;
  final TextInputType numbertextinputtype;
  final String? selectedCountry;
  final String? selectedCode;
  final void Function() openAddExpenseOverlay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const BackButtonWidget(),
       const SizedBox(height: 15),
       const TitleHeaderWidget(title: 'Personal Details', subtitle: 'Please fill the field provided correctly.'),
        const SizedBox(height: 15),
        TextFieldWidget(
            controller: nameController,
            title: 'First Name',
            labeled: 'Enter your first name',
            textInputType: nametextinputtype,
            textobsure: false),
        const SizedBox(height: 15),
        TextFieldWidget(
            textobsure: false,
            controller: lastNameController,
            title: 'Last Name',
            labeled: 'Enter your last name',
            textInputType: lastnametextinputtype),
        const SizedBox(height: 15),
        TextFieldWidget(
            textobsure: false,
            controller: emailController,
            title: 'Email Address',
            labeled: 'Enter your email address',
            textInputType: emailtextinputtype),
        const SizedBox(height: 15),
        Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Country',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: const Color(0xff474256))),
            const SizedBox(height: 10),
            InkWell(
              onTap: openAddExpenseOverlay,
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                height: 50,
                width: 102,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [
                  Image.asset(selectedCountry!),
                  Text(selectedCode!),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ]),
              ),
            )
          ]),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: const Color(0xff474256))),
                  const SizedBox(height: 10),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: numberController,
                        keyboardType: numbertextinputtype,
                        decoration: InputDecoration(
                          hintText: '814 308 3149',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(255, 65, 55, 94)),
                          border: InputBorder.none,
                        ),
                      ))
                ]),
          ),
        ]),
        const SizedBox(height: 15),
        NavigationStyle('continue', () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const CreatePasswordScreen();
          }));
        })
      ],
    );
  }
}
