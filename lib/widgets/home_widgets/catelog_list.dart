import 'package:catelog/models/catalog.dart';
import 'package:catelog/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';
import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          final Item catalog = CatalogModel.items[index];
          return InkWell(
            onTap: ()=> Navigator.push<void>(
              context, 
              // ignore: always_specify_types
              MaterialPageRoute(
                builder: (BuildContext context)=>HomeDetailPage(
                  catalog: catalog,
                  
                  )
                  )
                  ),
            child: CatelogItem(
              catalog: catalog
              )
            );
        });
  }
}
class CatelogItem extends StatelessWidget {
  final Item catalog;
  // ignore: sort_constructors_first
  const CatelogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      
        child: Row(
          
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image
            )
            ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.sm.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                 new AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

