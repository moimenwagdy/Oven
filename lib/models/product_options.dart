class OptionValue {
  final String id;
  final String title;
  const OptionValue({required this.id, required this.title});
  factory OptionValue.fromJson(Map<String, dynamic> json) =>
      OptionValue(id: json['id'] as String, title: json['title'] as String);
  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}

class OptionGroup {
  final String id;
  final String title;
  final List<OptionValue> values;
  final int minChoices;
  final int? maxChoices;

  OptionGroup({
    required this.id,
    required this.title,
    required List<OptionValue> values,
    this.minChoices = 0,
    this.maxChoices,
  }) : values = List.unmodifiable(values),
       assert(minChoices >= 0),
       assert(maxChoices == null || maxChoices >= minChoices);

  bool get isRequired => minChoices > 0;

  int resolveMax(int splitting) => maxChoices ?? splitting;

  bool isValidSelection(int count, int splitting) =>
      count >= minChoices && count <= resolveMax(splitting);

  factory OptionGroup.fromJson(Map<String, dynamic> json) => OptionGroup(
    id: json['id'] as String,
    title: json['title'] as String,
    values: (json['values'] as List)
        .map((e) => OptionValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    minChoices: json['minChoices'] as int? ?? 0,
    maxChoices: json['maxChoices'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'values': values.map((v) => v.toJson()).toList(),
    'minChoices': minChoices,
    if (maxChoices != null) 'maxChoices': maxChoices,
  };
}

class ProductOptions {
  final int splitting;
  final List<OptionGroup> groups;

  ProductOptions({required List<OptionGroup> groups, this.splitting = 1})
    : groups = List.unmodifiable(groups),
      assert(splitting >= 1);

  factory ProductOptions.fromJson(Map<String, dynamic> json) => ProductOptions(
    splitting: json['splitting'] as int? ?? 1,
    groups: (json['groups'] as List)
        .map((e) => OptionGroup.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'splitting': splitting,
    'groups': groups.map((g) => g.toJson()).toList(),
  };
}
