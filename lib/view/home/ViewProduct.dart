import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class ProductView extends StatefulWidget {
  final Map pObj;

  const ProductView({super.key,  required this.pObj});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.pObj['image']), fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 22,
                  left: 12,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.black,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                     
                        value = value + 1;
                      
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (value > 1) {
                        value = value - 1;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ],
            )),
            Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pObj['name'],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    Text(
                      '\$${value*30}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: TColor.primary, fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 8, 18, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae ligula euismod, aliquam nunc nec, aliquam est. Nullam auctor, nunc id lacinia tincidunt, nisl nunc aliquet nunc, nec tincidunt nunc nisl id nunc.',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 20,
                          ),
                          Text(
                            widget.pObj['rate'],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.primary, fontSize: 14, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Text(
                        "(${widget.pObj["rating"]} Ratings)",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        widget.pObj['food_type'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.share),
              //   color: Colors.white,
              // ),

              // Remove the following code block

              IconButton(
                onPressed: () {
                  const snackBar = SnackBar(content: Text('Added successfully'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.favorite_border),
                color: Colors.red,
              ),

              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            // SizedBox(width: 8),
                            Text(
                              'Purchase Successful',
                              style: TextStyle(fontSize: 16),
                            ),
                            
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            // SizedBox(width: 8),
                            Text(
                              'Added Successful',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
