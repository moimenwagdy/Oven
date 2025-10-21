import 'package:flutter/material.dart';
import 'package:oven/utils/constants/colors.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class Destination {
  const Destination({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

List<NavigationDestination> destinations(BuildContext context) => [
  NavigationDestination(
    label: context.l10n.home,
    icon: const Icon(Icons.home, size: 25),
    selectedIcon: const Icon(Icons.home, color: primary, size: 30),
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

int? indexFromLocation(String location) {
  if (location.startsWith('/home')) {
    return 0;
  }
  if (location.startsWith('/orders')) {
    return 2;
  }
  if (location.startsWith('/account')) {
    return 3;
  }
  if (location.startsWith('/products')) {
    return 1;
  }
  ;
  {
    return null;
  }
}
