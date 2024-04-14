import 'package:flutter/material.dart';
import 'package:food_delivery/view/home/ViewProduct.dart';
import 'package:food_delivery/view/menu/item_details_page.dart';
import 'package:food_delivery/view/menu/item_details_view.dart';
import '../../common_widget/round_textfield.dart';

class ProductPopUp extends StatefulWidget {
  final Map pObj;
  const ProductPopUp({super.key, required this.pObj});

  @override
  State<ProductPopUp> createState() => _ProductPopUpState();
}

class _ProductPopUpState extends State<ProductPopUp> {
  TextEditingController txtEmail = TextEditingController();
  bool val1 = false;
  bool val2 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Your Order Info',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 12),
          const Text(
            'When Would you like your order?',
            style: TextStyle(fontSize: 10, color: Colors.red),
          ),
          Row(
            children: [
              Checkbox(
                value: val1,
                onChanged: (newValue) {
                  setState(() {
                    val1 = newValue ?? false;
                    if (val1) {
                      val2 = false;
                    }
                  });
                },
              ),
              const Text(
                'As soon as possible',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: val2,
                onChanged: (newValue) {
                  setState(() {
                    val2 = newValue ?? false;
                    if (val2) {
                      val1 = false;
                    }
                  });
                },
              ),
              const Text('Schedule date and time',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
          if (val2)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RoundTextfield(
                hintText: "Enter Date",
                controller: txtEmail,
                keyboardType: TextInputType.datetime,
              ),
            ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => ProductView(pObj: widget.pObj),
                builder: (context) => const ItemDetailsView(),
              ),
            );
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
