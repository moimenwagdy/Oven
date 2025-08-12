import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArabicCairoText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style; // ✅ NEW

  const ArabicCairoText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyMedium;

    return Text(
      text,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLines: maxLines,
      overflow: overflow,
      style: (style ?? defaultStyle)?.copyWith(
        fontFamily: GoogleFonts.cairo().fontFamily,
        fontSize: fontSize ?? style?.fontSize ?? defaultStyle?.fontSize,
        fontWeight: fontWeight ?? style?.fontWeight ?? defaultStyle?.fontWeight,
        color: color ?? style?.color ?? defaultStyle?.color,
      ),
    );
  }
}
