import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/ModelProduct.dart';

class UpdateProductServices {
  Future<Modelproduct> put(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
