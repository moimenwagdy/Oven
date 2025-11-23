import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';

class ProfilePageSection extends StatelessWidget {
  final String sectionTitle;
  final String sectionData;
  final VoidCallback? onClick;
  const ProfilePageSection({
    super.key,
    required this.sectionTitle,
    required this.sectionData,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: context.isSmallDevice ? 40 : 50,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryFixed,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              offset: Offset(0, 1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: (context.screenWidth - 50) * .31,
              child: Text(
                sectionTitle,
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              width: (context.screenWidth - 50) * .55,
              child: Text(
                maxLines: 2,
                sectionData,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Spacer(),
            SizedBox(
              width: (context.screenWidth - 50) * .12,
              child: IconButton(
                disabledColor: Colors.grey.withValues(alpha: .5),
                onPressed: onClick,
                icon: Icon(
                  Icons.edit,
                  size: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
