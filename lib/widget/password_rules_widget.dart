import 'package:cardri_finance/reusable_custom_widget/password_rule_widget.dart';
import 'package:flutter/material.dart';

class PasswordRulesWidget extends StatelessWidget {
  const PasswordRulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PasswordRuleWidget(ruleText: 'Lowercase letter'),
            PasswordRuleWidget(ruleText: 'Uppercase letter'),
            PasswordRuleWidget(ruleText: 'Number'),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PasswordRuleWidget(ruleText: 'Special character'),
            PasswordRuleWidget(ruleText: '8 characters in length'),
            SizedBox(width: 60),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
