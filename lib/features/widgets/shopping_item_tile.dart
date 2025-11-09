import 'package:afrifounders_app/constants/helper_function.dart';
import 'package:flutter/material.dart';
import '../screens/edit_item_screen.dart';

class ShoppingItemTile extends StatelessWidget {
  final dynamic item;

  const ShoppingItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return ListTile(
      tileColor: dark
          ? Colors.white.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.1),
      title: Text(
        item.name,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(overflow: TextOverflow.ellipsis),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => EditItemScreen(item: item)),
      ),
    );
  }
}
