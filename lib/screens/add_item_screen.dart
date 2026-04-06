import 'package:flutter/material.dart';
import '../models/items.dart';
import '../services/firestore_service.dart';
import '../widgets/item_form.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final FirestoreService service = FirestoreService();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an item name';
    }
    return null;
  }

  String? _validateQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a quantity';
    }

    final quantity = int.tryParse(value.trim());
    if (quantity == null || quantity < 0) {
      return 'Enter a valid non-negative integer';
    }

    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a price';
    }

    final price = double.tryParse(value.trim());
    if (price == null || price < 0) {
      return 'Enter a valid non-negative price';
    }

    return null;
  }

  Future<void> _addItem() async {
    if (!_formKey.currentState!.validate()) return;

    final item = Item(
      name: _nameController.text.trim(),
      quantity: int.parse(_quantityController.text.trim()),
      price: double.parse(_priceController.text.trim()),
    );

    await service.addItem(item);

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ItemForm(
          formKey: _formKey,
          nameController: _nameController,
          quantityController: _quantityController,
          priceController: _priceController,
          validateName: _validateName,
          validateQuantity: _validateQuantity,
          validatePrice: _validatePrice,
          onSubmit: _addItem,
        ),
      ),
    );
  }
}