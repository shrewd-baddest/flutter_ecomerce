import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text(price, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 10),
          Image.asset(imageUrl, height: 100, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
