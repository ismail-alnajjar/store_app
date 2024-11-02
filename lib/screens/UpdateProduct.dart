import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Widget/CustomButton.dart';
import 'package:store_app/Widget/CustomTextField.dart';
import 'package:store_app/model/ModelProduct.dart';
import 'package:store_app/services/update_services.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({this.NameText});
  final String? NameText;

  static String id = 'AddProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? description, image, title, price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    Modelproduct product =
        ModalRoute.of(context)!.settings.arguments as Modelproduct;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  NameText: 'Product Name',
                  onChanged: (data) {
                    title = data;
                  },
                ),
                CustomTextField(
                  NameText: 'Description',
                  onChanged: (data) {
                    description = data;
                  },
                ),
                CustomTextField(
                  NameText: 'Price',
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                CustomTextField(
                  NameText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButon(
                  title: 'Update',
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await UpdateProductOnTapInButton(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(
                      () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProductOnTapInButton(Modelproduct product) async {
    await UpdateProductServices().put(
        id: product.id,
        title: title == null ? product.title : title!,
        price: price == null
            ? product.price.toString()
            : double.tryParse(price!)?.toString() ?? product.price.toString(),
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
