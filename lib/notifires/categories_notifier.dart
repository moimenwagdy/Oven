import 'package:flutter/material.dart';

// ValueNotifier<String> selectedCategory = ValueNotifier("");
ValueNotifier<int> selectedCategoryIndex = ValueNotifier(0);

class SelectedCategoryState {
  final int selectedCategoryIndex;
  SelectedCategoryState(this.selectedCategoryIndex);
}

final selectedCategoryState = ValueNotifier(SelectedCategoryState(0));
