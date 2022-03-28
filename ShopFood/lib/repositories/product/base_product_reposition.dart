import 'package:shopfood/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}