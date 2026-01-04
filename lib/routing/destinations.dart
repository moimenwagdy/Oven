import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

List<NavigationDestination> destinations(
  BuildContext context,
) => [
  NavigationDestination(
    label: context.l10n.home,
    icon: const Icon(Icons.home, size: 25),
    selectedIcon: Icon(Icons.home, color: primary, size: 30),
  ),
  NavigationDestination(
    label: context.l10n.products,
    icon: const Icon(Icons.food_bank, size: 25),
    selectedIcon: const Icon(Icons.food_bank, color: primary, size: 30),
  ),
  NavigationDestination(
    label: context.l10n.orders,
    icon: const Icon(Icons.list, size: 25),
    selectedIcon: const Icon(Icons.list, color: primary, size: 30),
  ),
  NavigationDestination(
    label: context.l10n.account,
    icon: const Icon(Icons.person, size: 25),
    selectedIcon: const Icon(Icons.person, color: primary, size: 30),
  ),
];
