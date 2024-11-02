import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/ModelProduct.dart';
import 'package:http/http.dart' as http;

class AddProductServices {
  Future<Modelproduct> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return Modelproduct.fromJson(data);
  }
}
