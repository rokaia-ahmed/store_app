
import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class AllProductService{
 Future <List<ProductModel>> getProduct()async{
    List <dynamic> data =
     await Api().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> productList = [] ;

      for (int i =0; i < data.length ; i++){
        productList.add(ProductModel.jsonData(data[i]));
      }
   // print(productList);
      return productList;

  }


}