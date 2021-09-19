import 'package:catelog/core/store.dart';
import 'package:catelog/models/cart.dart';
import 'package:catelog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class AddToCart extends StatelessWidget {
  final Item catalog;
  // ignore: sort_constructors_first
  const AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   // ignore: always_specify_types
    VxState.watch(context, on: [AddMutation]);
   final CartModel _cart= (VxState.store as MyStore).cart;   
    final bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      
      onPressed: (){
      
        if(!isInCart){
          AddMutation(catalog);
        }
      }, 
      style: ButtonStyle(
      
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(const StadiumBorder())
      ),
    child: isInCart ?  const Icon(Icons.done): const Icon(CupertinoIcons.cart_badge_plus));
  }
}