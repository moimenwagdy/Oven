import 'package:flutter/material.dart';
import 'package:oven/utils/helpers/localization_extension.dart';

class Destination {
  const Destination({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

List<NavigationDestination> destinations(BuildContext context) => [
  NavigationDestination(icon: const Icon(Icons.home), label: context.l10n.home),
  NavigationDestination(
    icon: const Icon(Icons.list),
    label: context.l10n.orders,
  ),
  NavigationDestination(
    icon: const Icon(Icons.person),
    label: context.l10n.account,
  ),
];

int? indexFromLocation(String location) {
  if (location.startsWith('/home') || location.startsWith('/products')) {
    return 0;
  }
  if (location.startsWith('/orders')) {
    return 1;
  }
  if (location.startsWith('/account')) return 2;
  {
    return null;
  }
}
