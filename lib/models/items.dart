
class Item {
  final String? id;
  final String name;
  final int quantity;
  final double price;

  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  // Item to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  // Firestore map to Item
  factory Item.fromMap(String id, Map<String, dynamic> map) {
    return Item(
      id: id,
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: (map['price'] ?? 0).toDouble(),
    );
  }
}