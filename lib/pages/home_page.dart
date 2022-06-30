import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_services.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
         IconButton(onPressed: (){},
             icon:const Icon(FontAwesomeIcons.cartArrowDown,
               color: Colors.black,
         )),
        ],
        title:const Text('New Trend',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProductService().getProduct(),
          builder: (context,snapshot){
             return  BuildCondition(
              condition:snapshot.hasData ,
              builder: (context){
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount:products.length ,
                  clipBehavior: Clip.none,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    //mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) => CustomCard(product:products[index] ),
                );
              },
              fallback:(context) =>const Center(child: CircularProgressIndicator()),
            );

          },
        ),
      ),
    );
  }
}
