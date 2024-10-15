import 'package:deal_mart/data/product_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetails extends StatefulWidget {
  final String id;

  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Map<String, dynamic> product = {};

  @override
  void initState() {
    super.initState();
    product = getProductById(widget.id)!;
  }

  Map<String, dynamic>? getProductById(String id) {
    return products.firstWhere((product) => product['id'] == id);
  }

  @override
  Widget build(BuildContext context) {
    final name = product['name'] as String;
    final seller = product['seller'] as String;
    final price = product['price'] as String;
    final image = product['image'] as String;
    final discount = product['discount'] as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('More Options!')),
              );
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Favorite');
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              icon: const Icon(Icons.favorite_border,color: Colors.red,),
              label: const Text(
                'Favorite',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Fluttertoast.showToast(msg: 'Buy Now');
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color.fromRGBO(39, 95, 96, 1),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white,),
              label: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 3 / 5,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: '\$$price ',
                      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: Colors.black),
                      children: [
                        TextSpan(
                          text: '\$$price', // Replace with actual original price if different
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  if (discount != '0')
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                    color: const Color.fromRGBO(208, 247, 226, 1),
                    borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text(
                      '$discount% off',
                      style: const TextStyle(
                        color: Color.fromRGBO(41, 135, 85, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildDetailsSection('Details :', Icons.info_outline),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    endIndent: 12,
                  ),
                  _buildDetailsRow(
                    icon: Icons.store,
                    label: 'Seller',
                    value: seller,
                  ),
                  const SizedBox(height: 15),
                  _buildDetailsRow(
                    icon: Icons.shopping_cart,
                    label: 'Quantity',
                    value: '10',
                  ),
                  const SizedBox(height: 15),
                  _buildDetailsRow(
                    icon: Icons.description,
                    label: 'Description',
                    value: 'This is the product description.',
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 20,),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDetailsRow({required IconData icon, required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
