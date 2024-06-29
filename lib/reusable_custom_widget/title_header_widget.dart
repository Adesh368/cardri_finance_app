import 'package:flutter/material.dart';

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget(
      {required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1B1B1B),
              ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xff474256),
              ),
        ),
      ],
    );
  }
}
