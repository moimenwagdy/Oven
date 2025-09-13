import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/widgets/login_page_widgets/google_facebook_apple_icons/login_with_google_apple_facebook_icons.dart';

class LoginWithGoogleAppleFacebook extends StatelessWidget {
  final String? type;
  const LoginWithGoogleAppleFacebook({super.key, this.type});
  @override
  Widget build(BuildContext context) {
    final bool isNewMerchant = type == "newMerchant";
    return Column(
      spacing: 10.h,
      children: [
        Opacity(
          opacity: .5,
          child: Text(
            isNewMerchant ? context.l10n.signupWith : context.l10n.connectOptions,
            textAlign: TextAlign.center,
          ),
        ),
        LoginWithGoogleAppleFacebookIcons(),
      ],
    );
  }
}
