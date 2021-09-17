import 'package:catelog/models/cart.dart';
import 'package:catelog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  CatalogModel catalog;
  CartModel cart;

 // ignore: sort_constructors_first
 MyStore()
      : catalog = CatalogModel(),
        cart = CartModel(){
          cart.catalog = catalog;
        }
}