import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

const destinations = [
  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
  NavigationDestination(icon: Icon(Icons.list), label: 'Orders'),
  NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
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
