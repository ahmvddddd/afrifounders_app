import 'package:afrifounders_app/constants/custom_sizes.dart';
import 'package:afrifounders_app/constants/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/shopping_item.dart';
import '../widgets/edit_item_form.dart';

class EditItemScreen extends ConsumerWidget {
  final ShoppingItem? item;
  const EditItemScreen({super.key, this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item == null ? 'Add Item' : 'Edit Item',
        style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(responsiveSize(context, CustomSizes.spaceBtwItems)),
          child: EditItemForm(item: item),
        ),
      ),
    );
  }
}
