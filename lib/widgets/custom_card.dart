import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product.dart';

class CustomCard extends StatelessWidget {
   CustomCard({Key? key,required this.product}) : super(key: key);
   ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> UpdateProductPage(product:product ,)));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            width: 220,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(0.2),
                      offset:const Offset(10,10)
                  ),
                ]
            ),
            child: Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0,6),
                      style:const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price}',
                          style:const TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                       const Icon(Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            right: 35,
            child: Image.network(product.image,
              height: 80,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
