
import '../helper/api.dart';
import '../models/product_model.dart';
class CategoriesService{

 Future<List<ProductModel>> getCategoriesProduct({required String categoryName})async{
   List<dynamic> data = (await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName')) as List;
    List<ProductModel> productList = [] ;
    for (int i =0; i <data.length ; i++){
      productList.add(ProductModel.jsonData(data[i]));
    }
    return productList;
  }
}