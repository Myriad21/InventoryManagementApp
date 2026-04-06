import 'package:flutter/material.dart';
import '../models/items.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  final void Function(Item item) onEdit;
  final Future<void> Function(Item item) onDelete;

  const ItemList({
    super.key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No items yet.'));
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          child: ListTile(
            title: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Quantity: ${item.quantity}'),
                Text('Price: \$${item.price.toStringAsFixed(2)}'),
              ],
            ),
            isThreeLine: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => onEdit(item),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await onDelete(item);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}