import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    required this.errortext,
    required this.erroeimage2,
    required this.erroeimage1,
    super.key,
  });

  final String errortext;
  final String erroeimage1;
  final String erroeimage2;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 0,
      left: 0,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Image.asset(erroeimage1),
            const SizedBox(width: 5),
            Text(
              errortext,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color(0xffD70D4A),
                  ),
            ),
            const Spacer(),
            Image.asset(erroeimage2)
          ])),
    );
  }
}
