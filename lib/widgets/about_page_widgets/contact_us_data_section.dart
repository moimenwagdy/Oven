import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class ContactUsDataSection extends StatelessWidget {
  const ContactUsDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            SizedBox(width: 80, child: Text("${context.l10n.address} :")),
            Text("22 strret street, Alexandria, Egypt"),
          ],
        ),
        Wrap(
          children: [
            SizedBox(width: 80, child: Text("${context.l10n.email} :")),
            Text("oven@oven.com"),
          ],
        ),
        Wrap(
          children: [
            SizedBox(width: 80, child: Text("${"Phone"} :")),
            Text("010 123 1247 1"),
          ],
        ),
      ],
    );
  }
}
