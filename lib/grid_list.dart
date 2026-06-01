import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details.dart';

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),

      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetails(product: product),
              ),
            );
          },
          child: ProductCard(
            imageUrl: product['image'],
            name: product['name'],
            price: '\$${product["price"]}',
          ),
        );
        // );
      },
    );
  }
}
