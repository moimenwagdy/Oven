import 'package:flutter/material.dart';

class LayoutImageStack extends StatelessWidget {
  const LayoutImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 370),
      child: Image.asset("lib/assets/logo_larg.png", fit: BoxFit.cover),
    );
  }
}
