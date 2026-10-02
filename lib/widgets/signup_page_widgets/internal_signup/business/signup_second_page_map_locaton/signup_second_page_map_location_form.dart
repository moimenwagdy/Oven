import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/pages/account_pages/map_page.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class SignupSecondPageMapLocationForm extends ConsumerStatefulWidget {
  final void Function(LatLng) onCameraMove;
  final void Function() onSubmit;

  const SignupSecondPageMapLocationForm({
    super.key,
    required this.onCameraMove,
    required this.onSubmit,
  });

  @override
  ConsumerState<SignupSecondPageMapLocationForm> createState() =>
      _SignupSecondPageMapLocationFormState();
}

class _SignupSecondPageMapLocationFormState
    extends ConsumerState<SignupSecondPageMapLocationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MapPage(onCameraMove: widget.onCameraMove),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: FormSubmitButtom(
                      textChild: Text(
                        context.l10n.continueButton,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      onPressed: () => widget.onSubmit(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
