import 'package:velocity_x/velocity_x.dart';

import 'package:catelog/core/store.dart';
import 'package:catelog/models/catalog.dart';

class CartModel{

  // static final cartModel = CartModel._internal();
  // CartModel._internal();

  // factory CartModel()=> cartModel;
  //Catalog fields
 late CatalogModel _catalog;
 

  //Collection of Ids- store Ids of each items
  final List<int> _itemIds=[];

 //Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog =newCatalog;
  }

  //get items in the cart

  List<Item> get items=> _itemIds.map((int id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (num total, Item current) => total+current.price);


  //Remove item

  void remove(Item item)
  { 
    _itemIds.remove(item.id);
  }
}
class AddMutation extends VxMutation<MyStore> {
   final Item item;
 // ignore: sort_constructors_first
 AddMutation(this.item);
  @override
  void perform() {
    store!.cart._itemIds.add(item.id);
  
  }
}
  class RemoveMutation extends VxMutation<MyStore> {
   final Item item;
 // ignore: sort_constructors_first
 RemoveMutation(this.item);
  @override
  void perform() {
    store!.cart._itemIds.remove(item.id);
  
  }

}
