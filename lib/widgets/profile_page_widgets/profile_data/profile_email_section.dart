import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/profile_actions_provider/profile_actions_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_single_field_edit_form.dart';

class ProfileEmailSection extends ConsumerStatefulWidget {
  const ProfileEmailSection({super.key});

  @override
  ConsumerState<ProfileEmailSection> createState() =>
      _ProfileEmailSectionState();
}

class _ProfileEmailSectionState extends ConsumerState<ProfileEmailSection> {
  final TextEditingController emailController = TextEditingController();
  bool editEmail = false;
  bool _saving = false;
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
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
        .updateEmail(emailController.text);

    if (!mounted) return;
    setState(() {
      _saving = false;
      errorMessage = error;
      if (error == null) editEmail = false; // close the form on success
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(currentSessionProvider)?.email ?? '';

    return Column(
      children: [
        if (!editEmail)
          ProfilePageSection(
            sectionTitle: context.l10n.email,
            sectionData: email,
            onClick: () {
              setState(() {
                editEmail = true;
                errorMessage = null;
                if (editEmail)
                  emailController.text = email; // start from current
              });
            },
          ),
        if (editEmail)
          ProfilePageSingleFieldEditForm(
            label: "Email",
            controller: emailController,
            onConfirm: _save,
            onCancel: () {
              setState(() {
                editEmail = false;
              });
            },
          ),
        if (editEmail && errorMessage != null)
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
