import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              _showCartDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    _addToCart(items[index]);
                  },
                );
              },
            ),
          ),
          Divider(),
          _buildCart(),
        ],
      ),
    );
  }

  Widget _buildCart() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Cart',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          if (cartItems.isEmpty)
            Text('Your cart is empty.')
          else
            Column(
              children: cartItems
                  .map((item) => ListTile(
                title: Text(item),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    _removeFromCart(item);
                  },
                ),
              ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  void _addToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void _removeFromCart(String item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  void _showCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Shopping Cart'),
          content: Column(
            children: [
              for (var item in cartItems) Text(item),
            ],
          ),
          actions: [
           /* FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),*/
          ],
        );
      },
    );
  }
}
