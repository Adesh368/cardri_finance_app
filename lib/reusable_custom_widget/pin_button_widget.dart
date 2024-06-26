import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  final String btntxt;
  final  Function() onPressed;

  const PinButton({required this.btntxt, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Text(
          btntxt,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
