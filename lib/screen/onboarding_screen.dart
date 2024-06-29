import 'package:cardri_finance/reusable_custom_widget/nav_button.dart';
import 'package:cardri_finance/reusable_custom_widget/onboarding_content.dart';
import 'package:cardri_finance/data/onboarding_text_data.dart';
import 'package:cardri_finance/screen/sign_up.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int current = 0;
  bool isLastPageReached = false;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  void _onPageChanged(int index) {
    setState(() {
      current = index;
      if (index == contents.length - 1) {
        isLastPageReached = true;
      } else {
        isLastPageReached = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 40, top: 15),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.7,
                width: screenWidth,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      contents.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        width: 86,
                        height: 6,
                        decoration: BoxDecoration(
                          color: (index == 0 || index <= current)
                              ? const Color(0xffD70D4A)
                              : const Color(0xffffffff),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35,),
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: _onPageChanged,
                      controller: _controller,
                      itemCount: contents.length,
                      itemBuilder: (ctx, index) {
                        return OnboardingContentWidget(
                          image: contents[index].image,
                          text: contents[index].text,
                          subtext: contents[index].subtext,
                        );
                      },
                    ),
                  ),
                ]),
              ),
              const Spacer(),
              NavigationStyle(
                'Create an Account',
                () {
                  if (isLastPageReached) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  } else {
                    _controller?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


