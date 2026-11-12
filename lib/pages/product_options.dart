import 'package:flutter/material.dart';
import 'package:oven/models/product_options.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/products_page_widgets/helpers/products_dummy_data.dart';
import 'package:collection/collection.dart';

class ProductOptions extends StatelessWidget {
  final String productId;
  const ProductOptions({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final list = context.isArabic ? arabicProducts : englishProducts;

    final product = list.firstWhereOrNull(
      (ele) => ele.id.toString() == productId,
    );
    debugPrint(
      'param=$productId ids=${list.map((e) => '${e.id}(${e.id.runtimeType})').toList()}',
    );

    return Row(
      children: [
        Expanded(
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Product With Options Page ",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "${product?.title}",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     for (final group
              //         in product!.options?.groups ?? const <OptionGroup>[])
              //       OptionGroupSection(
              //         group: group,
              //         splitting: product.options!.splitting,
              //         selected: {},
              //         onToggle: (valueId) {},
              //       ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

// class OptionGroupSection extends StatelessWidget {
//   const OptionGroupSection({
//     super.key,
//     required this.group,
//     required this.splitting,
//     required this.selected,
//     required this.onToggle,
//   });

//   final OptionGroup group;
//   final int splitting;
//   final Set<String> selected;
//   final ValueChanged<String> onToggle;

//   @override
//   Widget build(BuildContext context) {
//     final max = group.resolveMax(splitting);
//     final canSelectMore = selected.length < max;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             group.isRequired ? '${group.title} *' : group.title,
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//           Text(
//             max == 1 ? 'Choose 1' : 'Choose up to $max',
//             style: Theme.of(context).textTheme.bodySmall,
//           ),
//           const SizedBox(height: 8),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: [
//               for (final value in group.values)
//                 FilterChip(
//                   label: Text(value.title),
//                   selected: selected.contains(value.id),
//                   // block selecting more once max is reached,
//                   // but always allow deselecting
//                   onSelected: (selected.contains(value.id) || canSelectMore)
//                       ? (_) => onToggle(value.id)
//                       : null,
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
