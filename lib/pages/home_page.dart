import 'package:catelog/models/catalog.dart';
import 'package:catelog/utils/routes.dart';
import 'package:catelog/widgets/home_widgets/catalog_header.dart';
import 'package:catelog/widgets/home_widgets/catelog_list.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart,
              color: Colors.white,
              ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const CatelogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatelogList().py16().expand()
              else
                const CircularProgressIndicator().centered().py16().expand(),
                
            ],
          ),
        ),
      ),
    );
  }
}


