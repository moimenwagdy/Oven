import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oven/pages/account_pages/map_page.dart';
import 'package:oven/providers/signup_providers/manager_location_provider/manager_location_notifier.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class ManagerLocationForthPageMap extends ConsumerStatefulWidget {
  final void Function(LatLng) onCameraMove;

  const ManagerLocationForthPageMap({super.key, required this.onCameraMove});

  @override
  ConsumerState<ManagerLocationForthPageMap> createState() =>
      _ManagerLocationForthPageMapState();
}

class _ManagerLocationForthPageMapState
    extends ConsumerState<ManagerLocationForthPageMap> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    context.push("/manageraddress");
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
                MapPage(onCameraMove: widget.onCameraMove, isManager: true),
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
                    onPressed: () => _onSubmit(context),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: FormSubmitButtom(
                    textChild: Text(
                      "Skip",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    onPressed: () {
                      ref.read(managerLocationProvider.notifier).skip();
                      context.go("/home");
                    },
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
