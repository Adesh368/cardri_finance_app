import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PinInputBox extends StatelessWidget {
  PinInputBox({
    this.obscuremode = true,
    this.isLast = false,
    required this.controller,
    this.readonly = true,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final bool isLast;
  final bool readonly;
  final ValueChanged<String>? onChanged; 
  bool obscuremode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        readOnly: readonly,
        controller: controller,
        obscureText: obscuremode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged, 
        decoration: InputDecoration(
          border: InputBorder.none,
          labelStyle: GoogleFonts.mulish(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1F1F1F),
          ),
        ),
      ),
    );
  }
}
