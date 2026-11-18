import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/models/delivery_location_info.dart';
import 'package:oven/providers/profile_actions_provider/edit_adress_form_notifier.dart';
import 'package:oven/providers/profile_actions_provider/profile_actions_provider.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class EditProfileAddressForm extends ConsumerStatefulWidget {
  final String targetId;
  final bool isManagerAddress;
  final bool? edit;
  const EditProfileAddressForm({
    super.key,
    required this.targetId,
    required this.isManagerAddress,
    this.edit = false,
  });

  @override
  ConsumerState<EditProfileAddressForm> createState() =>
      _EditProfileAddressFormState();
}

class _EditProfileAddressFormState
    extends ConsumerState<EditProfileAddressForm> {
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final floorController = TextEditingController();
  final flatController = TextEditingController();
  final detailsController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      final formState = ref.read(editAddressFormProvider);

      cityController.text = formState.address.city;
      areaController.text = formState.address.area;
      streetController.text = formState.address.street;
      buildingController.text = formState.address.building;
      floorController.text = formState.address.floor;
      flatController.text = formState.address.flat;
      detailsController.text = formState.address.details;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cityController.dispose();
    areaController.dispose();
    streetController.dispose();
    buildingController.dispose();
    floorController.dispose();
    flatController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(editAddressFormProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomSignupLoginInputAndLabel(
                      controller: cityController,
                      label: context.l10n.city,
                      placeholder: context.l10n.enterCity,
                      type: TextInputType.text,
                      onChanged: (value) {
                        notifier.setCity(value);
                        Validators.validateIsNotEmpty(value);
                      },
                      validator: (value) =>
                          Validators.validateIsNotEmpty(value),
                    ),
                    CustomSignupLoginInputAndLabel(
                      controller: areaController,
                      label: context.l10n.area,
                      placeholder: context.l10n.selectArea,
                      type: TextInputType.text,
                      onChanged: (value) => notifier.setArea(value),
                      validator: (value) =>
                          Validators.validateIsNotEmpty(value),
                    ),
                    CustomSignupLoginInputAndLabel(
                      controller: streetController,
                      label: context.l10n.street,
                      placeholder: context.l10n.enterStreet,
                      type: TextInputType.text,
                      onChanged: (value) => notifier.setStreet(value),
                      validator: (value) =>
                          Validators.validateIsNotEmpty(value),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSignupLoginInputAndLabel(
                          controller: buildingController,
                          label: context.l10n.bulidingNum,
                          placeholder: context.l10n.bulidingNum,
                          type: TextInputType.text,
                          isSmall: true,
                          onChanged: (value) => notifier.setBuilding(value),
                          validator: (value) => Validators.validateIsNotEmpty(
                            value,
                            message: "Required",
                          ),
                        ),
                        CustomSignupLoginInputAndLabel(
                          isSmall: true,
                          controller: floorController,
                          label: context.l10n.floorNum,
                          placeholder: context.l10n.floorNum,
                          type: TextInputType.text,
                          onChanged: (value) => notifier.setFloor(value),
                          validator: (p0) => Validators.validateIsNotEmpty(
                            p0,
                            message: "Required",
                          ),
                        ),
                        CustomSignupLoginInputAndLabel(
                          isSmall: true,
                          controller: flatController,
                          label: context.l10n.flatNum,
                          placeholder: context.l10n.flatNum,
                          type: TextInputType.text,
                          onChanged: (value) => notifier.setFlat(value),
                          validator: (p0) => Validators.validateIsNotEmpty(
                            p0,
                            message: "Required",
                          ),
                        ),
                      ],
                    ),
                    CustomSignupLoginInputAndLabel(
                      controller: detailsController,
                      onChanged: (value) => notifier.setDetails(value),
                      label: context.l10n.moreDetails,
                      placeholder: context.l10n.moreDetails,
                      type: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: FormSubmitButtom(
              textChild: Text(
                context.l10n.submit,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: onPrimary),
              ),
              onPressed: () {
                if (!formKey.currentState!.validate()) return;
                if (widget.isManagerAddress == false) {
                  notifier.submit(widget.targetId);
                  ref.invalidate(editAddressFormProvider);
                } else {
                  final managerAdressState = ref.read(editAddressFormProvider);
                  final nweDeliveryLocation = DeliveryLocationInfo(
                    latitude: managerAdressState.location.latitude!,
                    longitude: managerAdressState.location.longitude!,
                    address: managerAdressState.address,
                  );
                  ref
                      .read(profileActionsProvider.notifier)
                      .updateManagerAdress(nweDeliveryLocation);
                  ref.invalidate(editAddressFormProvider);
                }
                context.pop();
                // notifier.setAddress();
                // ref.read(navigationIndexProvider.notifier).setNavigationIndex(5);
                // shell.goBranch(5, initialLocation: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
