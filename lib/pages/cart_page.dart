import 'package:catelog/core/store.dart';
import 'package:catelog/models/cart.dart';
import 'package:catelog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  const _CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart= (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxBuilder(
           builder: (BuildContext context, _, VxStatus) {
            return '\$${_cart.totalPrice}'.
             text.xl4.
             color(context.theme.accentColor).
             make();
           }, 
           mutations: {RemoveMutation},
           ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
            ),
             child: 'Buy'.text.white.make()
             ).w32(context)
        ],
      ),
    );
  }
}
class _cartList extends StatelessWidget {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart= (VxState.store as MyStore).cart;
    return _cart.items.isEmpty?
      'Nothing to Show'.text.xl3.makeCentered()
     : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
       leading: const Icon(Icons.done),
       trailing: IconButton(
         icon: const Icon(
           Icons.remove_circle_outline), 
       onPressed: ()=> RemoveMutation(_cart.items[index]),
       ),
       title: _cart.items[index].name.text.make(),
      ));
  }
}