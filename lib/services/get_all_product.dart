import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/ModelProduct.dart';

class GetAllProduct {
  Future<List<Modelproduct>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products', token: '');

    List<Modelproduct> ListProducts = [];
    for (int i = 0; i < data.length; i++) {
      ListProducts.add(Modelproduct.fromJson(data[i]));
    }

    return ListProducts;
  }
}
