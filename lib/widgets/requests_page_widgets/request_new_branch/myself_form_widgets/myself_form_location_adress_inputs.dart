import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/create_new_branch_request_provider/new_branch_form_notifier.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/validators.dart';
import 'package:oven/widgets/custom_widgets/custom_signup_login_input_and_label.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class MyselfFormLocationAdressInputs extends ConsumerStatefulWidget {
  const MyselfFormLocationAdressInputs({super.key});
  @override
  ConsumerState<MyselfFormLocationAdressInputs> createState() =>
      _MyselfFormLocationAdressInputsState();
}

class _MyselfFormLocationAdressInputsState
    extends ConsumerState<MyselfFormLocationAdressInputs> {
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

    final formState = ref.read(newBranchRequestFormProvider);

    cityController.text = formState.address.city;
    areaController.text = formState.address.area;
    streetController.text = formState.address.street;
    buildingController.text = formState.address.building;
    floorController.text = formState.address.floor;
    flatController.text = formState.address.flat;
    detailsController.text = formState.address.details;
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
    final notifier = ref.read(newBranchRequestFormProvider.notifier);

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
