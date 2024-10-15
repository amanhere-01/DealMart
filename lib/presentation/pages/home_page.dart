import 'dart:math';

import 'package:deal_mart/data/product_list.dart';
import 'package:deal_mart/presentation/pages/product_details.dart';
import 'package:deal_mart/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(39, 95, 96, 1),
        title: const Text(
          'Hello, Jack',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignIn()), (route) => false);
              Fluttertoast.showToast(
                  msg: 'Signed Out',
              );
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white,)
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth < 600 ? 2 : 5;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 2/3,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              final id = product['id'] as String;
              final name = product['name'] as String;
              final seller = product['seller'] as String;
              final price = product['price'] as String;
              final image = product['image'] as String;
              final discount = product['discount'] as String;

              return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetails(id: id,)));},
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(discount!='0')
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
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
                                fontSize: 10
                            ),
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10) ,
                            child: Image.asset(image, )),
                        )
                      ),
                      const SizedBox(height: 3,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              seller,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,

                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: '\$$price ',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(39, 95, 96, 1)
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '\$$price',
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: Colors.grey
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
