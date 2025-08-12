import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFontCourgette extends StatelessWidget {
  const TextFontCourgette({
    super.key,
    required this.child,
    required this.style,
  });
  final String child;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(child, style: GoogleFonts.courgette(textStyle: style));
  }
}
