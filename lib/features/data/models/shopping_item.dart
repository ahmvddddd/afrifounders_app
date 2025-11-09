class ShoppingItem {
  final String id;
  final String name;

  ShoppingItem({required this.id, required this.name});
  
  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  factory ShoppingItem.fromMap(Map<String, dynamic> map) =>
      ShoppingItem(id: map['id'], name: map['name']);
}
