import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'search.dart'; // Import the search screen

class HomePage extends StatefulWidget {
  const HomePage({super.key, required List<Product> products});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                    products: products), // Use the search delegate
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'New Arrivals'),
            Tab(text: 'Exclusive'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildNewArrivals(),
          _buildExclusive(),
        ],
      ),
    );
  }

  Widget _buildNewArrivals() {
    final List<Product> newProducts =
        products.where((product) => !product.isExclusive).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: newProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: newProducts[index],
          onTap: () {
            Navigator.pushNamed(context, '/product_detail',
                arguments: newProducts[index]);
          },
        );
      },
    );
  }

  Widget _buildExclusive() {
    final List<Product> exclusiveProducts =
        products.where((product) => product.isExclusive).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: exclusiveProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: exclusiveProducts[index],
          onTap: () {
            Navigator.pushNamed(context, '/product_detail',
                arguments: exclusiveProducts[index]);
          },
        );
      },
    );
  }

  final List<Product> products = [
    Product(
        id: 1,
        name: 'Men Shirt 1',
        description: 'Description',
        price: 29.99,
        image: 'lib/images/shirt1.jpg',
        isExclusive: false),
    Product(
        id: 2,
        name: 'Men Shirt 2',
        description: 'Description',
        price: 39.99,
        image: 'lib/images/shirt2.jpg',
        isExclusive: false),
    Product(
        id: 3,
        name: 'Men Shirt 3',
        description: 'Description',
        price: 19.99,
        image: 'lib/images/shirt3.jpg',
        isExclusive: true),
    Product(
        id: 4,
        name: 'Men Shirt 4',
        description: 'Description',
        price: 49.99,
        image: 'lib/images/shirt4.jpg',
        isExclusive: false),
    Product(
        id: 5,
        name: 'Men Shirt 5',
        description: 'Description',
        price: 59.99,
        image: 'lib/images/shirt5.jpeg',
        isExclusive: true),
    Product(
        id: 6,
        name: 'Men Shirt 6',
        description: 'Description',
        price: 69.99,
        image: 'lib/images/shirt6.jpg',
        isExclusive: true),
    Product(
        id: 7,
        name: 'Men Shirt 7',
        description: 'Description',
        price: 79.99,
        image: 'lib/images/shirt7.jpeg',
        isExclusive: false),
    Product(
        id: 8,
        name: 'Women Churidar 1',
        description: 'Description',
        price: 29.99,
        image: 'lib/images/women1.jpg',
        isExclusive: false),
    Product(
        id: 9,
        name: 'Women Churidar 2',
        description: 'Description',
        price: 39.99,
        image: 'lib/images/women2.jpg',
        isExclusive: false),
    Product(
        id: 10,
        name: 'Women Churidar 3',
        description: 'Description',
        price: 19.99,
        image: 'lib/images/women3.jpg',
        isExclusive: true),
    Product(
        id: 11,
        name: 'Kids Dress 1',
        description: 'Description',
        price: 49.99,
        image: 'lib/images/kid1.jpg',
        isExclusive: false),
    Product(
        id: 12,
        name: 'Kids Dress 2',
        description: 'Description',
        price: 59.99,
        image: 'lib/images/kid2.jpg',
        isExclusive: false),
    Product(
        id: 13,
        name: 'Kids Dress 3',
        description: 'Description',
        price: 69.99,
        image: 'lib/images/kid3.jpg',
        isExclusive: true),
  ];
}
