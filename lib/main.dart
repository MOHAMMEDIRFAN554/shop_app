import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
// ignore: unused_import
import 'screens/home.dart';
import 'screens/shopping.dart';
import 'screens/bag.dart';
import 'screens/checkout.dart';
import 'screens/payment.dart';
import 'screens/profile.dart';
import 'screens/orders.dart';
import 'screens/settings.dart';
import 'screens/product_detail.dart';
import 'screens/order_success.dart';
import 'screens/favorites.dart';
import 'screens/main_screen.dart';
import 'screens/search.dart'; // Import the search screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Product> allProducts = [
    Product(
      id: 1,
      name: 'Men Shirt 1',
      description: 'Description',
      price: 29.99,
      image: 'lib/images/shirt1.jpg',
      isExclusive: false,
    ),
    Product(
      id: 2,
      name: 'Men Shirt 2',
      description: 'Description',
      price: 39.99,
      image: 'lib/images/shirt2.jpg',
      isExclusive: false,
    ),
    // Add other products
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/login', 
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => MainScreen(products: allProducts),
        '/shopping': (context) => ShoppingPage(),
        '/bag': (context) => BagPage(),
        '/favorites': (context) => FavoritesPage(),
        '/profile': (context) => ProfilePage(),
        '/checkout': (context) => CheckoutPage(),
        '/product_detail': (context) => ProductDetailPage(),
        '/order_success': (context) => OrderSuccessPage(),
        '/orders': (context) => OrdersPage(),
        '/payment': (context) => PaymentPage(),
        '/settings': (context) => SettingsPage(),
        '/search': (context) => SearchScreen(products: allProducts), // Fixed route
      },
    );
  }
}
