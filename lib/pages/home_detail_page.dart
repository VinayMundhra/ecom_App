import 'package:catelog/models/catalog.dart';
import 'package:catelog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  // ignore: sort_constructors_first
  const HomeDetailPage({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl3.make(),
            AddToCart(
              catalog: catalog
              ).wh(120, 50)
          ],
        ).p32(),
      ).p12(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.hairLine.xl.make(),
                      //10.heightBox,
                      'A super-powerful chip. An advanced dual-camera system. A Ceramic Shield front that’s tougher than any smartphone glass. And a bright, beautiful OLED display. A super-powerful chip. An advanced dual-camera system. A Ceramic Shield front that’s tougher than any smartphone glass. And a bright, beautiful OLED display.'
                      .text.hairLine.sm
                      .make().p20()
                    ],
                  ).py64(),
                ),
              ),
            ))
          ],
        ).p16(),
      ),
    );
  }
}
