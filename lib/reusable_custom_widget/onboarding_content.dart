import 'package:flutter/material.dart';

class OnboardingContentWidget extends StatelessWidget {
  const OnboardingContentWidget(
      {required this.image,
      required this.text,
      required this.subtext,
      super.key});

  final String image;
  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1B1B1B),
              ),
        ),
        const SizedBox(height: 10,),
        Text(
          subtext,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               
                color: const Color(0xff1B1B1B),
              ),
        ),
        const SizedBox(height: 30,),
        Center(child: Image.asset(image))
      ],
    );
  }
}
