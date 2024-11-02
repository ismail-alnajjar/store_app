import 'package:store_app/helper/Api.dart';
import 'package:store_app/model/ModelProduct.dart';

class GategoryServices {
  Future<List<Modelproduct>> gategoryServices(
      {required String category_name}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category_name');

    List<Modelproduct> GategoryList = [];
    for (int i = 0; i < data.length; i++) {
      GategoryList.add(Modelproduct.fromJson(data[i]));
    }
    return GategoryList;
  }
}
