import 'package:flutter/material.dart';

class AboutPageSectionData extends StatelessWidget {
  final String sectionData;
  const AboutPageSectionData({super.key, required this.sectionData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        sectionData,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
