import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  CheckoutPageState createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage> {
  final String _shippingAddress = "John Doe, 123 Main Street, City, Country";
  final String _paymentMethod = "Mastercard **** 1234";
  String _deliveryMethod = "FedEx (2-3 days)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildSectionTitle('Shipping Address'),
            _buildShippingAddress(),
            const SizedBox(height: 20),
            _buildSectionTitle('Payment Method'),
            _buildPaymentMethod(),
            const SizedBox(height: 20),
            _buildSectionTitle('Delivery Method'),
            _buildDeliveryMethod(),
            const SizedBox(height: 20),
            _buildOrderSummary(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/order_success');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('SUBMIT ORDER'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildShippingAddress() {
    return ListTile(
      title: Text(_shippingAddress),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Change'),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return ListTile(
      title: Text(_paymentMethod),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Change'),
      ),
    );
  }

  Widget _buildDeliveryMethod() {
    return Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('FedEx (2-3 days)'),
          value: 'FedEx (2-3 days)',
          groupValue: _deliveryMethod,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _deliveryMethod = value;
              });
            }
          },
        ),
        RadioListTile<String>(
          title: const Text('USPS (2-3 days)'),
          value: 'USPS (2-3 days)',
          groupValue: _deliveryMethod,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _deliveryMethod = value;
              });
            }
          },
        ),
        RadioListTile<String>(
          title: const Text('DHL (2-3 days)'),
          value: 'DHL (2-3 days)',
          groupValue: _deliveryMethod,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _deliveryMethod = value;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    const double orderTotal = 99.99;
    const double deliveryFee = 5.99;
    const double total = orderTotal + deliveryFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Order Total: \$${orderTotal.toStringAsFixed(2)}'),
        Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}'),
        Text(
          'Total: \$${total.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
