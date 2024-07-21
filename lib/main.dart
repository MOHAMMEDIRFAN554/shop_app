import 'package:flutter/material.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/shopping.dart';
import 'screens/bag.dart';
import 'screens/favorites.dart';
import 'screens/profile.dart';
import 'screens/checkout.dart';
import 'screens/product_detail.dart';
import 'screens/order_success.dart';
import 'screens/orders.dart';
import 'screens/payment.dart';
import 'screens/settings.dart';
import 'screens/main_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/login', 
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => MainScreen(),
        '/shopping': (context) => const ShoppingPage(),
        '/bag': (context) => const BagPage(),
        '/favorites': (context) => FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
        '/checkout': (context) => const CheckoutPage(),
        '/product_detail': (context) => const ProductDetailPage(),
        '/order_success': (context) => const OrderSuccessPage(),
        '/orders': (context) => OrdersPage(),
        '/payment': (context) => const PaymentPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
