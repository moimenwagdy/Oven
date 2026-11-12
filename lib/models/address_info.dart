class AddressInfo {
  /// Optional name for the address, like "Home" or "Work". Used for personal
  /// addresses (personal users and managers). Empty means no label.
  final String label;
  final String city;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String flat;
  final String details;

  const AddressInfo({
    this.label = '',
    this.city = '',
    this.area = '',
    this.street = '',
    this.building = '',
    this.floor = '',
    this.flat = '',
    this.details = '',
  });

  AddressInfo copyWith({
    String? label,
    String? city,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? flat,
    String? details,
  }) {
    return AddressInfo(
      label: label ?? this.label,
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      flat: flat ?? this.flat,
      details: details ?? this.details,
    );
  }
}
