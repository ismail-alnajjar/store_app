import 'package:flutter/material.dart';
import 'package:store_app/model/ModelProduct.dart';
import 'package:store_app/screens/UpdateProduct.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.product, super.key});
  final Modelproduct product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(0, 2)),
            ]),
            child: Card(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0, 11)),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product.price.toString()}'),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -50,
              right: 35,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
