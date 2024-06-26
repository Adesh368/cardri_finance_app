import 'package:flutter/material.dart';

class HelpBottomBar extends StatelessWidget {
  const HelpBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: const BoxDecoration(
          color: Color(0xff07052A),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.headset_mic,
              color: Color(0xffB4ACCA),
            ),
            const SizedBox(width: 8), // Add spacing between icon and text
            Text(
              'Need Help?',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color(0xffB4ACCA),
                  ),
            ),
            const SizedBox(width: 4), // Add spacing between texts
            InkWell(
              onTap: () {
                // Add your onTap logic here
              },
              child: Text(
                'Click Here',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xffD70D4A),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
