import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/profile_actions_provider/profile_actions_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_single_field_edit_form.dart';

class ProfilePhoneSection extends ConsumerStatefulWidget {
  const ProfilePhoneSection({super.key});

  @override
  ConsumerState<ProfilePhoneSection> createState() =>
      _ProfilePhoneSectionState();
}

class _ProfilePhoneSectionState extends ConsumerState<ProfilePhoneSection> {
  final TextEditingController phoneController = TextEditingController();
  bool editPhone = false;
  bool _saving = false;
  String? errorMessage;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() {
      _saving = true;
      errorMessage = null;
    });

    final error = await ref
        .read(profileActionsProvider.notifier)
        .updatePhone(phoneController.text);

    if (!mounted) return;
    setState(() {
      _saving = false;
      errorMessage = error;
      if (error == null) editPhone = false; // close the form on success
    });
  }

  @override
  Widget build(BuildContext context) {
    final phone = ref.watch(currentSessionProvider)?.phone ?? '';

    return Column(
      children: [
        if (!editPhone)
          ProfilePageSection(
            sectionTitle: context.l10n.phoneNumber,
            sectionData: phone,
            onClick: () {
              setState(() {
                editPhone = true;
                errorMessage = null;
                if (editPhone)
                  phoneController.text = phone; // start from current
              });
            },
          ),
        if (editPhone)
          ProfilePageSingleFieldEditForm(
            label: "Phone",
            controller: phoneController,
            onConfirm: _save,
            onCancel: () {
              setState(() {
                editPhone = false;
              });
            },
          ),
        if (editPhone && errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorMessage!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
