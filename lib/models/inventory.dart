// pubspec.yaml dependencies needed:
// dependencies:
//   flutter:
//     sdk: flutter
//   http: ^1.1.0
//   cached_network_image: ^3.3.0

// models/inventory_item.dart
class InventoryItem {
  final String id;
  final String name;
  final String type;
  final int quantity;
  final int available;
  final String laboratory;

  InventoryItem({
    required this.id,
    required this.name,
    required this.type,
    required this.quantity,
    required this.available,
    required this.laboratory,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      quantity: json['quantity'] ?? 0,
      available: json['available'] ?? 0,
      laboratory: json['laboratory'] ?? '',
    );
  }

  double get availabilityPercentage => quantity > 0 ? (available / quantity) * 100 : 0;
  
  bool get isLowStock => availabilityPercentage < 20;
  
  bool get isOutOfStock => available == 0;
}

