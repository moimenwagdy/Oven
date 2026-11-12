import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oven/providers/current_session_provider/current_session_provider.dart';
import 'package:oven/providers/profile_actions_provider/profile_actions_provider.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/profile_page_widgets/profile_data/profile_data_error_message.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_section.dart';
import 'package:oven/widgets/profile_page_widgets/profile_page_single_field_edit_form.dart';

class ProfileNameSection extends ConsumerStatefulWidget {
  const ProfileNameSection({super.key});

  @override
  ConsumerState<ProfileNameSection> createState() => _ProfileNameSectionState();
}

class _ProfileNameSectionState extends ConsumerState<ProfileNameSection> {
  final TextEditingController nameController = TextEditingController();
  bool editName = false;
  bool _saving = false;
  String? errorMessage;

  @override
  void dispose() {
    nameController.dispose();
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
        .updateName(nameController.text);

    if (!mounted) return;
    setState(() {
      _saving = false;
      errorMessage = error;
      if (error == null) editName = false; // close the form on success
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(currentSessionProvider)?.name ?? '';

    return Column(
      children: [
        if (!editName)
          ProfilePageSection(
            sectionTitle: context.l10n.userName,
            sectionData: name,
            onClick: () {
              setState(() {
                editName = true;
                errorMessage = null;
                if (editName) nameController.text = name; // start from current
              });
            },
          ),
        if (editName)
          ProfilePageSingleFieldEditForm(
            label: "Name",
            controller: nameController,
            onConfirm: _save,
            onCancel: () {
              setState(() {
                editName = false;
              });
            },
          ),
        if (editName && errorMessage != null)
          Container(
            padding: EdgeInsets.only(top: 2, left: 8),
            height: 15,
            child: Row(
              children: [ProfileDataErrorMessage(errorMessage: errorMessage!)],
            ),
          ),
      ],
    );
  }
}
