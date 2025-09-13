import 'package:flutter/material.dart';

class HeaderImageDonuts extends StatelessWidget {
  const HeaderImageDonuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 16),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedRotation(
            duration: Duration(microseconds: 3000),
            turns: 5,
            child: Image.asset("lib/assets/donut.png", width: 25),
          ),
          Text("Categories", style: Theme.of(context).textTheme.displaySmall),
        ],
      ),
    );
  }
}
