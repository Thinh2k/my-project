import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{

  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String informationProduct;



  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.informationProduct,
});


  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
        informationProduct: snap['informationProduct'],
    );
    return product;
  }



  @override
  List<Object?> get props => [name, category, imageUrl, price, isRecommended, isPopular, informationProduct];


  static List<Product> products = [
    Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
      'https://media.istockphoto.com/photos/pork-chops-packaged-in-a-container-picture-id453032631?s=612x612',
      price: 2.99,
      isRecommended: true,
      isPopular: false,
      informationProduct: 'Thức uống ngon bổ rẻ 1',
    ),
    Product(
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
      'https://vui.unsplash.com/resize?height=256&quality=60&type=auto&url=https%3A%2F%2Fsearched-images.s3.us-west-2.amazonaws.com%2F9be5c4dd-98ae-406f-b25e-2b4df18e96ab%3FX-Amz-Algorithm%3DAWS4-HMAC-SHA256%26X-Amz-Credential%3DAKIAJ4ATIV7TEVKIW3RQ%252F20220328%252Fus-west-2%252Fs3%252Faws4_request%26X-Amz-Date%3D20220328T085419Z%26X-Amz-Expires%3D86400%26X-Amz-SignedHeaders%3Dhost%26X-Amz-Signature%3Dac4d88ca34108691178503b5112cbd0619fcc5d2947e35fe40c5549ddc6f1e47&sign=8qKIMPzyia9tf9nUJsqbhLj-x1WkFbXebYgvSnpxpgE', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
      informationProduct: 'Thức uống ngon bổ rẻ 2',
    ),
    Product(
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
      'https://vui.unsplash.com/resize?height=256&quality=60&type=auto&url=https%3A%2F%2Fsearched-images.s3.us-west-2.amazonaws.com%2Fcb166639-a07b-4e3a-b2cf-8a1a1318fd3b%3FX-Amz-Algorithm%3DAWS4-HMAC-SHA256%26X-Amz-Credential%3DAKIAJ4ATIV7TEVKIW3RQ%252F20220328%252Fus-west-2%252Fs3%252Faws4_request%26X-Amz-Date%3D20220328T085921Z%26X-Amz-Expires%3D86400%26X-Amz-SignedHeaders%3Dhost%26X-Amz-Signature%3D98c4c5aec0dc07dc91fa751639aec3df105ac7dea96c888892fd2c3cf4b3aa81&sign=mWBMzCF6mLR2IldFUrBloop-t51BtGHfx-bcFLfrAG0', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
      informationProduct: 'Thức uống ngon bổ rẻ 3',
    ),
    Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
      'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 2.99,
      isRecommended: true,
      isPopular: false,
      informationProduct: 'Thức uống ngon bổ rẻ 4 ',
    ),
    Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
      'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thức uống ngon bổ rẻ 5',
    ),
  ];
}
