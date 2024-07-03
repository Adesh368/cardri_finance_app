import 'package:cardri_finance/reusable_custom_widget/backbutton_widegt.dart';
import 'package:cardri_finance/reusable_custom_widget/error_message_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/help_bottom_bar.dart';
import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/reusable_custom_widget/textfield_widget.dart';
import 'package:cardri_finance/reusable_custom_widget/title_header_widget.dart';
import 'package:flutter/material.dart';

class NinUserInputScreen extends StatefulWidget {
  const NinUserInputScreen({super.key});

  @override
  State<NinUserInputScreen> createState() => _NinUserInputScreenState();
}

class _NinUserInputScreenState extends State<NinUserInputScreen> {
  final controller = TextEditingController();
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
                              title: 'NIN Verification',
                              subtitle:
                                  'Your provided details helps us provide you with our personalized bank account for wallet funding.'),
                          const SizedBox(height: 40),
                          TextFieldWidget(
                              controller: controller,
                              title: 'NIN',
                              labeled: 'Enter your 11 digit NIN',
                              textInputType: TextInputType.number,
                              textobsure: false),
                          const SizedBox(height: 20),
                          /*
                          Container(
                            height: 64,
                            decoration: BoxDecoration(
                                color: const Color(0xffEFD1DC),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/info.png'),
                                  const SizedBox(width: 10),
                                  Row(children: [
                                    Text(
                                      'Dial ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      '*565*0# ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontSize: 10,
                                              color: const Color(0xffFA9232)),
                                    ),
                                    Text(
                                      'on your registered phone number to get your BVN',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ]),
                                ]),
                          ),*/
                          const SizedBox(height: 40),
                          NavigationStyle('continue', () {})
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
