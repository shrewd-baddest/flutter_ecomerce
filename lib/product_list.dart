import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/grid_list.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> shoeTypes = [
    'Sneakers',
    'Boots',
    'Sandals',
    'Loafers',
    'Heels',
  ];
  late String selectedFilter;
  @override
  initState() {
    super.initState();
    selectedFilter = shoeTypes[0];
  }

  static const border = OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50.0)),
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  );
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'shoes\n Collection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoeTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // Update the selected filter when a chip is tapped
                        selectedFilter = shoeTypes[index];
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == shoeTypes[index]
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[200],
                      side: BorderSide(color: Colors.grey, width: 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      label: Text(shoeTypes[index]),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return GridList();
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(product: product),
                            ),
                          );
                        },
                        child: ProductCard(
                          imageUrl: product['image'],
                          name: product['name'],
                          price: '\$${product["price"]}',
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
