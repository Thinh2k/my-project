import 'package:equatable/equatable.dart';
import 'package:shopfood/models/product_model.dart';

class Cart extends Equatable{
  final List<Product> products ;

  const Cart({this.products = const <Product>[]});

  Map productQuantity(products){
    var quantity = Map();

    products.forEach((products){
      if(!quantity.containsKey(products)){
        quantity[products] = 1;
      }else {
        quantity[products] +=1;
      }
    });
    return quantity;
  }


  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFree(subtotal){
    if(subtotal >= 200000.0){
      return 20000.0;
    }else
      return 00.0;
  }

  double total(subtotal, deliveryFree){
    return subtotal - deliveryFree(subtotal);
}

  String freeDelivery(subtotal){
    if(subtotal >=200000.0){
      return 'Đang sử dụng ưu đãi giảm giá';
    } else{
      double missing = 200000.0 - subtotal;
      return ' Thêm ${missing.toStringAsFixed(2)}\đ Để được giảm giá';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);

  String get deliveryFreeString  => deliveryFree(subtotal).toStringAsFixed(2);

  String get freeDeliveryString  => freeDelivery(subtotal);



  @override
  List<Object?> get props => [products];
}