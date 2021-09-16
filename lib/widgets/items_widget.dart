import 'package:flutter/material.dart';
import 'package:catelog/models/catalog.dart';

class ItemWidget  extends StatelessWidget {
  final Item item;
  

  // ignore: sort_constructors_first
  const ItemWidget ({Key? key, required this.item})
    : assert(item != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: (){
          print('${item.price} pressed');
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          '\$${item.price}',
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold
          )),
      ),
    );
  }
}