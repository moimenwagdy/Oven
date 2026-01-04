import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/orders_page_widgets/aligned_text.dart';

class OrderItemContent extends StatefulWidget {
  final List<String> contentItemsList;
  final String orderComment;
  const OrderItemContent({
    super.key,
    required this.contentItemsList,
    required this.orderComment,
  });

  @override
  State<OrderItemContent> createState() => _OrderItemContentState();
}

class _OrderItemContentState extends State<OrderItemContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                    context.isArabic? "تعليق" : " Comment",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      widget.orderComment,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Column(
        spacing: 5,
        children: [
          Text(
            context.l10n.orderItems,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontSize: 10),
          ),
          Expanded(
            child: Container(
              width: 154,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.onSurface.withValues(
                  alpha: context.isDarkMode ? .15 : .05,
                ),
              ),
              child: Scrollbar(
                scrollbarOrientation: context.isArabic
                    ? ScrollbarOrientation.right
                    : ScrollbarOrientation.left,
                thumbVisibility: true,
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget.contentItemsList.length,
                    itemBuilder: (context, index) {
                      return AlignedText(text: widget.contentItemsList[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
