import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oven/providers/cart_provider/cart_notifier.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom_widgets/custom_dialog_alert.dart';
import 'package:oven/widgets/custom_widgets/forms_custom_widgets/custom_form_submit_button.dart';

class ImagePickerButton extends ConsumerWidget {
  final String id;
  const ImagePickerButton({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final ImagePicker _picker = ImagePicker();
    final currentItem = ref.watch(
      cartProvider.select(
        (state) => state.value?.firstWhere((e) => e.id == id),
      ),
    );
    final selectedImage = currentItem?.image;
    Future<void> _pickImageFromGallery() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        await customDialogAlert(
          context: context,
          onConfirm: () {
            // if (!mounted) return;
            ref.read(cartProvider.notifier).addItemImage(id, image);
            // setState(() {
            //   _selectedImage = image;
            // });
            context.pop();
          },
          onCancel: () {
            // if (!mounted) return;

            if (selectedImage != null) {
              ref.read(cartProvider.notifier).addItemImage(id, null);
              // setState(() => _selectedImage = null);
            }
            context.pop();
          },
          message: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.screenWidth * .9,
              maxHeight: context.screenHeight * .7,
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: _buildImage(image),
            ),
          ),
          cancelationMessage: "cancel",
          confirmationMessage: "confirm",
        );
      }
    }

    return Row(
      spacing: 8,
      children: [
        SizedBox(
          width: context.isSmallDevice ? 30 : 35,
          height: 20,
          child: FormSubmitButtom(
            onPressed: _pickImageFromGallery,
            textChild: Icon(
              Icons.image,
              color: Colors.white,
              size: context.isSmallDevice ? 14 : null,
            ),
          ),
        ),
        if (selectedImage != null)
          GestureDetector(
            onTap: () => _showImagePreviewDialog(context, selectedImage),
            child: SizedBox(
              width: 20,
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: _buildImage(selectedImage, fit: BoxFit.cover),
              ),
            ),
          ),
      ],
    );
  }
}

Widget _buildImage(XFile image, {BoxFit fit = BoxFit.contain}) {
  if (kIsWeb) {
    return Image.network(image.path, fit: fit);
  } else {
    return Image.file(
      File(image.path),
      fit: fit,
      errorBuilder: (_, __, ___) =>
          const Center(child: Icon(Icons.broken_image)),
    );
  }
}

void _showImagePreviewDialog(BuildContext context, XFile selectedImage) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (contexts) {
      return AlertDialog(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.screenWidth * .9,
            maxHeight: context.screenHeight * .7,
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: _buildImage(selectedImage),
          ),
        ),
      );
    },
  );
}
