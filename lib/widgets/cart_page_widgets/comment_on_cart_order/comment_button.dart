import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/cart_provider/cart_comment_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/comment_on_cart_order/comment_on_cart_order.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CommentButton extends ConsumerStatefulWidget {
  const CommentButton({super.key});

  @override
  ConsumerState<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends ConsumerState<CommentButton> {
  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(15, 0, 15, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: context.isSmallDevice ? 150 : 170,
            height: context.isSmallDevice ? 30 : 35,
            child: FormSubmitButtom(
              onPressed: () async {
                await customDialogAlert(
                  context: context,
                  onCancel: () => context.pop(),
                  onConfirm: () {
                    ref
                        .read(cartCommentProvider.notifier)
                        .setCartComment(_commentController.text);
                    context.pop();
                  },
                  message: CommentOnCartOrder(controller: _commentController),
                  confirmationMessage: context.isArabic ? "تأكيد" : "Confirm",
                  cancelationMessage: context.isArabic ? "إالغاء" : "Cancel",
                );
              },
              textChild: Text(
                " + ${context.isArabic ? "تعليق" : "Comment"}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: context.isSmallDevice ? 12 : 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
