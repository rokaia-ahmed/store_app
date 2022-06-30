
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_text_field.dart';

import '../services/update_product.dart';
import '../widgets/custom_Button.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({Key? key, required this.product}) : super(key: key);
   ProductModel? product;
  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? nameProduct ,desc , image ;
   String? price ;
   bool isLoading= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      title: const Text('Update Product',
      style: TextStyle(
        color: Colors.black,
      ),
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
             CustomTextFromField(
                 hintText: 'Product Name',
                 onChange: (data){
                   nameProduct = data ;
                 },
             ),
            const SizedBox(
               height: 10,
             ),
             CustomTextFromField(hintText: 'description',
             onChange: (data){
               desc = data ;
             },
             ),
              const SizedBox(
                height: 10,
              ),
             CustomTextFromField(hintText: 'Price',
               textType: TextInputType.number,
               onChange: (data){
                 price = data ;
               },
             ),
              const SizedBox(
                height: 10,
              ),
             CustomTextFromField(hintText: 'image',
               onChange: (data){
                 image = data ;
               },
             ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'update',
                onTap: ()async{
                  isLoading = true ;
                  setState(() { });
                    try {
                     await UpdateProduct().updateProduct(
                          id:widget.product!.id ,
                          title: nameProduct ==null ? widget.product!.title : nameProduct! ,
                          price: price == null ? widget.product!.price.toString() :price! ,
                          description: desc == null ? widget.product!.description :desc! ,
                          image: image == null ? widget.product!.image : image!,
                          category: widget.product!.category,
                     );

                          print('success');
                    }catch(e){
                      print(e.toString());
                    }
                  isLoading = false;
                  setState(() {
                  });
                },
              ),
              if(isLoading)
             const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
