import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/get_all_product_service.dart';
import 'package:shop/widgets/my_item_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });
  static const String id = 'homePage';

  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
        title: Text('New Trend', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.08, // بدل 65
          left: width * 0.04, // بدل 16
          right: width * 0.04, // بدل 16
          bottom: height * 0.03, // بدل 24
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      width / (height * 0.30), // تقريباً 1.6 حسب النسبة الأصلية
                  crossAxisSpacing: width * 0.06, // بدل 8
                  mainAxisSpacing: height * 0.07, // بدل 60
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemCard(product: products[index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
