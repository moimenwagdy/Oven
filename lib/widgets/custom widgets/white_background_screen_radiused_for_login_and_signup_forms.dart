import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteBackgroundScreenRadiusedForLoginAndSignupForms
    extends StatelessWidget {
  const WhiteBackgroundScreenRadiusedForLoginAndSignupForms({
    super.key,
    required this.childWidget,
    required this.heightPercent,
  });
  final Widget childWidget;
  final double heightPercent;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: !isDark
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: !isDark
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: null,
        actions: [],
        toolbarHeight: heightPercent == .95 ? 10.h : 10.h,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: screenHeight * heightPercent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
