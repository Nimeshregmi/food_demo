import 'package:flutter/material.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  String selectedSize = '';
  Map<String, double> sizePrices = {
    'Regular': 0.0, // Add your regular size price here
    'Large': 2.0, // Add your large size price here
  };
  String selectedBooster = '';

  Set<String> boosterOptions = {
    'None', // Add your booster options here
    'Light',
    'Extra',
  };
  Map<String, double> boosterPrices = {
    'None': 0.0, // Add your booster price here
    'Light': 1.0, // Add your booster price here
    'Extra': 2.0, // Add your booster price here
  };
  List<String> extraOptions = [
    'Extra cheese',
    'Extra toppings',
    'Extra sauce',
  ];

  void _addToCart() {
    if (selectedSize.isEmpty) {
      // Show popup if size is not selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Size not chosen'),
            content: Text('Please choose a size before adding to cart.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Proceed to add item to cart
      double totalPrice = sizePrices[selectedSize]!;
      // Add your logic here to handle modification prices
      print(
          'Item added to cart with size: $selectedSize, Price: \$$totalPrice');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: _addToCart,
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
