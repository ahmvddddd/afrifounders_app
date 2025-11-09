import 'package:afrifounders_app/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/shopping_items_controller.dart';
import '../data/models/shopping_item.dart';

class EditItemForm extends ConsumerStatefulWidget {
  final ShoppingItem? item;
  const EditItemForm({super.key, this.item});

  @override
  ConsumerState<EditItemForm> createState() => _EditItemFormState();
}

class _EditItemFormState extends ConsumerState<EditItemForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _controller.text = widget.item!.name;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveItem(BuildContext context) async {
    final notifier = ref.read(shoppingControllerProvider.notifier);
    final name = _controller.text.trim();

    if (name.isEmpty) return;

    if (widget.item == null) {
      await notifier.addItem(name);
    } else {
      await notifier.editItem(widget.item!.id, name);
    }

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Item name',
            labelStyle: Theme.of(context).textTheme.labelMedium
            ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _saveItem(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.primary
          ),
          child: Text(widget.item == null ? 'Add' : 'Save',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),),
        ),
      ],
    );
  }
}
