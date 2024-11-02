import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Widget/CustomCard.dart';
import 'package:store_app/model/ModelProduct.dart';
import 'package:store_app/services/get_all_product.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 128, 54),
        title: const Text(
          'New Trend',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 65, left: 8, right: 8, bottom: 20),
        child:
            ////////////////////////////////////////////////////////////////////////
            FutureBuilder<List<Modelproduct>>(
          future: GetAllProduct().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            }
            List<Modelproduct> products = snapshot.data!;
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 60,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  product: products[index],
                );
              },
            );
          },
        ),
        ////////////////////////////////////////////////////////////////////////
      ),
    );
  }
}
