import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../controllers/shopping_items_controller.dart';
import '../../../../constants/custom_colors.dart';
import '../../constants/custom_sizes.dart';
import '../../constants/responsive_size.dart';
import 'shopping_item_tile.dart';

class ShoppingList extends ConsumerWidget {
  final List items;
  final bool dark;

  const ShoppingList({
    super.key,
    required this.items,
    required this.dark,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(height: responsiveSize(context, CustomSizes.spaceBtwItems),),
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => ref
              .read(shoppingControllerProvider.notifier)
              .deleteItem(item.id),
          background: Container(
            color: CustomColors.error,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ShoppingItemTile(item: item),
        );
      },
    );
  }
}
