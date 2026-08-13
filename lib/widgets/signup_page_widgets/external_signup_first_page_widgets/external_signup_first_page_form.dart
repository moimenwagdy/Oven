import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';
import 'package:oven/widgets/signup_page_widgets/external_signup_first_page_widgets/external_signup_first_page_inputs.dart';
import 'package:oven/widgets/signup_page_widgets/signup_first_page_widgets/signup_first_page_inputs.dart';

class ExternalSignupFirstPageForm extends StatefulWidget {
  final String payload;
  const ExternalSignupFirstPageForm({super.key, required this.payload});

  @override
  State<ExternalSignupFirstPageForm> createState() =>
      _ExternalSignupFirstPageFormState();
}

class _ExternalSignupFirstPageFormState
    extends State<ExternalSignupFirstPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _managerEmailController = TextEditingController();
  final _managerNameController = TextEditingController();
  final _managerPhoneController = TextEditingController();
  final _managerAdressController = TextEditingController();
  final _managerPasswordController = TextEditingController();
  final _repeatManagerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isNewManager = widget.payload.startsWith("NM");
    final bool isNewManagerAndBranch = widget.payload.startsWith("NB");
    void onPress() async {
      if (_formKey.currentState!.validate()) {
        if (isNewManagerAndBranch) {
          print("the rededirect should be to the second page");
          context.push("/external/${widget.payload}/moreinfo");
        }
        if (isNewManager) {
          print("form should be submitted now");
        }
      } else {
        return null;
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          ExternalSignupFirstPageInputs(type: ""),
          SizedBox(height: 20.h),
          SizedBox(
            width: 220,
            height: 50,
            child: FormSubmitButtom(
              textChild: Text(
                isNewManagerAndBranch ? "Next" : context.l10n.submit,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              onPressed: onPress,
            ),
          ),
          SizedBox(height: 20.h),
          if (isNewManager)
            Text(
              "Submitting this form will confirm you as a manager for ${widget.payload} Branch ",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
