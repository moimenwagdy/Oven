import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/pages/account_pages/map_page.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class SignupSecondPageMapLocationForm extends ConsumerStatefulWidget {
  final void Function(LatLng) onCameraMove;

  const SignupSecondPageMapLocationForm({
    super.key,
    required this.onCameraMove,
  });

  @override
  ConsumerState<SignupSecondPageMapLocationForm> createState() =>
      _SignupSecondPageMapLocationFormState();
}

class _SignupSecondPageMapLocationFormState
    extends ConsumerState<SignupSecondPageMapLocationForm> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    context.push("/signup/type/location");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      "Continue",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    onPressed: () => _onSubmit(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
