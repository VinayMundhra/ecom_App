import 'package:catelog/models/catalog.dart';
import 'package:catelog/widgets/home_widgets/catalog_header.dart';

class CartModel{
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

  List<Item> get items=> _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, current) => total+current.price);

  //Add Item

  void add(Item item){
    _itemIds.add(item.id);
  }

  //Remove item

  void remove(Item item)
  {
    _itemIds.remove(item.id)
  }
}