import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';
import 'package:oven/utils/helpers/screen_dimensions_extensions.dart';
import 'package:oven/widgets/custom%20widgets/oven_logo.dart';
import 'package:oven/widgets/custom%20widgets/quantity_add_button_and_increase_decrease_buttons.dart';

class HomeMostOrderedItem extends StatelessWidget {
  const HomeMostOrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController quantityController = TextEditingController();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // radius
      ),
      color: Theme.of(context).colorScheme.primary.withValues(alpha: .05),
      elevation: 0,
      margin: EdgeInsets.only(bottom: 5),
      child: SizedBox(
        height: 85,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 15,
                children: [
                  SizedBox(width: 80, child: OvenLogo(minW: 40, maxW: 80)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.mostOrderedItemTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        context.l10n.mostOrderedItemTimesCount,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: context.isSmallDevice ? 0 : 10),
                child: QuantityAddButtonAndIncreaseDecreaseButtons(
                  controller: quantityController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:oven/widgets/custom%20widgets/oven_logo.dart';

// class HomeMostOrderedItem extends StatelessWidget {
//   const HomeMostOrderedItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6), // radius
//         ),
//         color: Theme.of(context).colorScheme.primary.withValues(alpha: .05),
//         elevation: 0,
//         margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
//         child: ListTile(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6), // radius
//           ),
//           leading: OvenLogo(minW: 40, maxW: 70),
//           title: Text("item Name"),
//           subtitle: Text("Ordered 24 times"),

//           trailing: Column(
//             children: [
//               OutlinedButton(onPressed: () => {}, child: Text("add to cart")),
//             ],
//           ),
//           isThreeLine: true,
//           leadingAndTrailingTextStyle: TextStyle(height: 900),
//           dense: true,
//           onTap: () => {print("index")},
//         ),
//       ),
//     );
//   }
// }
