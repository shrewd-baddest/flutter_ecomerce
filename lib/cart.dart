import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['image'] as String),
            ),
            title: Text(cartItem['name'] as String),
            subtitle: Text('\$${cartItem['price']}'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Remove Item"),
                      content: Text(
                        "Are you sure you want to remove this item from the cart?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeFromCart(index);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Remove",
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
