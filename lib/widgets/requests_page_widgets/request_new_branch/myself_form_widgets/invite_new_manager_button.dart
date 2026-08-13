import 'package:flutter/material.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class InviteNewManagerButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const InviteNewManagerButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 10),
      height: 50,
      child: FormSubmitButtom(
        textChild: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Invite New Manager",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
