import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product['size'][0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product['name'],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 5),
            Spacer(flex: 1),
            Image.asset(
              widget.product['image'],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Spacer(flex: 2),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 202, 202),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '\$${widget.product['price']}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.product['size'].length,
                          // final isSelected = Sizes[index] == 'M'; // Example condition for selection
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize =
                                        widget.product['size'][index];
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    widget.product['size'][index].toString(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  backgroundColor:
                                      selectedSize ==
                                          widget.product['size'][index]
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[200],
                                  side: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedSize != 0) {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).addToCart({
                              'name': widget.product['name'],
                              'price': widget.product['price'],
                              'image': widget.product['image'],
                              'size': selectedSize,
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to cart')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please select a size')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
