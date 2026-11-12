import 'package:flutter/material.dart';

class EditProfileAddressForm extends StatelessWidget {
  final String branch;
  final bool? edit;
  const EditProfileAddressForm({
    super.key,
    required this.branch,
    this.edit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(branch)]);
  }
}
