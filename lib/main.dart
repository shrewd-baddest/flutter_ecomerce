import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 95, 223, 10),
            primary: const Color.fromARGB(255, 95, 223, 10),
          ),
          appBarTheme: AppBarTheme(
            // color: Colors.black,
          ),

          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            prefixIconColor: Colors.grey,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            bodyMedium: TextStyle(fontSize: 16),
            headlineMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
