class ProductModel{
  final dynamic id ;
  final String title ;
  final dynamic price ;
  final String description ;
  final String image ;
  final RatingModel? rating ;
  final String category;

  ProductModel({
    required this.id ,
    required this.price ,
    required this.title ,
    required this.image ,
    required this.description ,
    required this.rating,
    required this.category,
  });
  factory ProductModel.jsonData( jsonData){
    return ProductModel(
        id: jsonData['id'],
        price: jsonData['price'],
        title: jsonData['title'],
        image: jsonData['image'],
        description: jsonData['description'],
        category: jsonData['category'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.jsonModel(jsonData['rating']));

  }

}
class RatingModel{
  final dynamic rate ;
  final int count ;
  RatingModel({
   required this.count,
    required this.rate,
});

  factory RatingModel.jsonModel( jsonData){
    return RatingModel(
        count:jsonData['count'] ,
        rate: jsonData['rate']);
  }
}