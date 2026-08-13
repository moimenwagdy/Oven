import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/myself_request%20_link_provider/other_person_request_link_provider.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:share_plus/share_plus.dart';

class OtherPersonLinkGeneratorButton extends ConsumerWidget {
  const OtherPersonLinkGeneratorButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkState = ref.watch(generateOtherPersonLinkProvider);
    return Column(
      spacing: 15,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Click on the button and share the link with whom will enter the new branch data",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 150,
          height: 50,
          child: FormSubmitButtom(
            textChild: linkState.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                : Text(
                    "Generate Link",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
            onPressed: linkState.value != null
                ? null
                : () {
                    ref
                        .read(generateOtherPersonLinkProvider.notifier)
                        .generateLink("NB-newBranchForm");
                  },
          ),
        ),
        if (linkState.value != null) Text(linkState.value!),
        if (linkState.value != null)
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Share.share(linkState.value!);
              },
              child: Text("Share"),
            ),
          ),
        if (linkState.value != null)
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Share.share(linkState.value!);
              },
              child: Text("Cancel"),
            ),
          ),
      ],
    );
  }
}
