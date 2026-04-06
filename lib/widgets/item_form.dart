import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final String? Function(String?) validateName;
  final String? Function(String?) validateQuantity;
  final String? Function(String?) validatePrice;
  final VoidCallback onSubmit;

  const ItemForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.quantityController,
    required this.priceController,
    required this.validateName,
    required this.validateQuantity,
    required this.validatePrice,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
            validator: validateName,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(),
            ),
            validator: validateQuantity,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(),
            ),
            validator: validatePrice,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}