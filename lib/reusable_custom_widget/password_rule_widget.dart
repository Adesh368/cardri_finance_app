import 'package:flutter/material.dart';

class PasswordRuleWidget extends StatelessWidget {
  final String ruleText;

  const PasswordRuleWidget({
    super.key,
    required this.ruleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ruleText.length > 15 ? 153 : ruleText.length > 10 ? 121 : 68,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(255, 202, 219, 231),
      ),
      child: Center(
        child: Text(
          ruleText,
          style: Theme.of(context).textTheme.bodySmall!,
        ),
      ),
    );
  }
}
