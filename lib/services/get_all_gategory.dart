
import 'package:store_app/helper/Api.dart';

class GetAllGategory {
  Future<List<dynamic>> getAllGategory() async {
    List<dynamic> data  =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    

    return data;
  }
}
