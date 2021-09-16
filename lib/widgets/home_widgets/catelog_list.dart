import 'package:catelog/models/catalog.dart';
import 'package:catelog/pages/home_detail_page.dart';
import 'package:catelog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
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
          child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.hairLine.sm.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: Vx.mOnly(right: 16),
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.make(),
                ElevatedButton(
                  onPressed: (){ 
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                child: "Buy".text.make())
              ],
            ).pOnly(right: 0.0)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}