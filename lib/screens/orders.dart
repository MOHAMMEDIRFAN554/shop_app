import 'package:flutter/material.dart';

class Order {
  final int id;
  final String status;
  final String trackingNumber;
  final int quantity;
  final double totalAmount;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.status,
    required this.trackingNumber,
    required this.quantity,
    required this.totalAmount,
    required this.orderDate,
  });
}

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);

  final List<Order> orders = [
    Order(
      id: 1947034,
      status: 'Delivered',
      trackingNumber: 'IW3475453455',
      quantity: 3,
      totalAmount: 112.00,
      orderDate: DateTime(2019, 12, 5),
    ),
    Order(
      id: 1947035,
      status: 'Processing',
      trackingNumber: 'IW3475453456',
      quantity: 1,
      totalAmount: 45.00,
      orderDate: DateTime(2024, 7, 20),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            const TabBar(
              tabs: [
                Tab(text: 'Delivered'),
                Tab(text: 'Processing'),
                Tab(text: 'Cancelled'),
              ],
              labelColor: Colors.red,
              indicatorColor: Colors.red,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OrdersList(
                      orders: orders
                          .where((order) => order.status == 'Delivered')
                          .toList()),
                  OrdersList(
                      orders: orders
                          .where((order) => order.status == 'Processing')
                          .toList()),
                  OrdersList(
                      orders: orders
                          .where((order) => order.status == 'Cancelled')
                          .toList()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 4,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/shop');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/bag');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/favorites');
              break;
            case 4:
              
              break;
          }
        },
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  const OrdersList({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          title: Text('Order #${order.id}'),
          subtitle: Text(
              'Status: ${order.status} \nTotal: \$${order.totalAmount.toStringAsFixed(2)}'),
          trailing: Text('Quantity: ${order.quantity}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailPage(order: order),
              ),
            );
          },
        );
      },
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  final Order order;

  const OrderDetailPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order ID: ${order.id}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${order.status}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Tracking Number: ${order.trackingNumber}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Quantity: ${order.quantity}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Amount: \$${order.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Order Date: ${order.orderDate.toLocal().toString().substring(0, 10)}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
