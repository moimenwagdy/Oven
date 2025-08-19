import 'package:flutter/material.dart';

class OvenLogo extends StatelessWidget {
  const OvenLogo({super.key, required this.maxW});
  final double maxW;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxW),
      child: Image.asset("lib/assets/logo_larg.png", fit: BoxFit.contain),
    );
  }
}
