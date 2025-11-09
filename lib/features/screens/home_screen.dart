import 'package:afrifounders_app/constants/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/custom_sizes.dart';
import '../../../../constants/helper_function.dart';
import '../../../../controllers/shopping_items_controller.dart';
import '../../controllers/theme_controller.dart';
import '../screens/edit_item_screen.dart';
import '../widgets/shopping_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(shoppingControllerProvider);
    final themeMode = ref.watch(themeControllerProvider);
    final dark = HelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping List',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.dark_mode_outlined,
            ),
            onPressed: () =>
                ref.read(themeControllerProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: SafeArea(
        child: items.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(CustomSizes.spaceBtwItems),
                  child: Text(
                    'No items yet, tap the button below to add new items.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Padding(
              padding: EdgeInsets.all(responsiveSize(context, CustomSizes.spaceBtwItems)),
              child: ShoppingList(items: items, dark: dark),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EditItemScreen()),
        ),
        backgroundColor: CustomColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
