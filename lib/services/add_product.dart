import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class AddProduct{
  
Future<ProductModel>  addProduct({
    required String title,required String price ,
   required String description ,required String image ,
    required String category })async{

   Map<String,dynamic> data = await Api().post(url: 'https://fakestoreapi.com/products',
        body:{
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category ,
        },
        );
   return ProductModel.jsonData(data) ;
  }

}