import 'package:flutter/material.dart';

class OvenLogo extends StatelessWidget {
  const OvenLogo({super.key, required this.minW, required this.maxW});
  final double maxW;
  final double minW;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxW, minWidth: minW),
      child: Image.asset("lib/assets/logo_larg.png", fit: BoxFit.contain),
    );
  }
}
