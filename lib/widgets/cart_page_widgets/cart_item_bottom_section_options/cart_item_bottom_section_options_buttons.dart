import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/cart_page_widgets/cart_item_bottom_section_options/image_picker_button.dart';
import 'package:oven/widgets/cart_page_widgets/comment_on_cart_order/comment_on_cart_order.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class CartItemBottomSectionOptionsButtons extends ConsumerWidget {
  final String id;
  final TextEditingController commentController;
  final bool allowAttachImage;
  const CartItemBottomSectionOptionsButtons({
    super.key,
    required this.id,
    required this.commentController,
    required this.allowAttachImage,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Transform.translate(
      offset: Offset(0, -1),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.fromLTRB(
            left: BorderSide(color: Colors.black.withValues(alpha: .05)),
            right: BorderSide(color: Colors.black.withValues(alpha: .05)),
            bottom: BorderSide(color: Colors.black.withValues(alpha: .05)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: context.isSmallDevice ? 5 : 8,
          children: [
            SizedBox(
              width: context.isSmallDevice ? 30 : 35,
              height: 20,
              child: FormSubmitButtom(
                onPressed: () async {
                  await customDialogAlert(
                    context: context,
                    onCancel: () {
                      context.pop(false);
                    },
                    onConfirm: () {
                      ref.read(cartProvider.notifier).removeItem(id);
                      context.pop();
                    },
                    message: Text("Are you sure you want to remove this item?"),
                    cancelationMessage: "Cancel",
                    confirmationMessage: "Confirm",
                  );
                },
                textChild: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            SizedBox(
              width: context.isSmallDevice ? 30 : 35,
              height: 20,
              child: FormSubmitButtom(
                onPressed: () {
                  customDialogAlert(
                    context: context,
                    onCancel: () {
                      context.pop();
                    },
                    onConfirm: () {
                      ref
                          .read(cartProvider.notifier)
                          .addItemComment(id, commentController.text);
                      context.pop();
                    },
                    message: CommentOnCartOrder(controller: commentController),
                    cancelationMessage: "Cancel",
                    confirmationMessage: "Confirm",
                  );
                },
                textChild: Icon(Icons.comment, color: Colors.white),
              ),
            ),
            if (allowAttachImage) ImagePickerButton(id: id),
          ],
        ),
      ),
    );
  }
}
