import 'package:flutter/material.dart';

class   NavigationStyle extends StatelessWidget {
  const NavigationStyle(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            backgroundColor:  const Color(0xffD70D4A),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
        child: Text(text),
      ),
    );
  }
}
