import 'package:shop/models/product_model.dart';

import '../helper/api.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts({String? token}) async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products",
      token: token,
    );

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
