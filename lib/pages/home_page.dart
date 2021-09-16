import 'package:catelog/models/catelog.dart';
import 'package:catelog/widgets/drawer.dart';
import 'package:catelog/widgets/items_widget.dart';
import 'package:catelog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future<dynamic>.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catelog.json');
    final dynamic decodedData = jsonDecode(catalogJson);
    final List<dynamic> productsData = decodedData['products'] as List<dynamic>;
    CatalogModel.items = List<dynamic>.from(productsData)
        .map<Item>((dynamic item) => Item.fromMap(item as Map<String, dynamic>))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CatelogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatelogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catelog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        'Trending products'.text.xl2.make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          final Item catalog = CatalogModel.items[index];
          return CatelogItem(catalog: catalog);
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
        CatalogImage(image: catalog.image),
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

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
