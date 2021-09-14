import 'package:catelog/models/catelog.dart';
import 'package:catelog/widgets/drawer.dart';
import 'package:catelog/widgets/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async{
  final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
        final dynamic decodedData = jsonDecode(catalogJson);
        final List<dynamic> productsData= decodedData['products'] as List <dynamic>;
        CatalogModel.items = List<Map>.from(productsData)
        .map<Item>((item) => Item.fromMap(item as Map<String, dynamic>))
        .toList();
        setState(() {
          
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catelog App'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (BuildContext context, int index){
            return ItemWidget(
              item: CatalogModel.items[index]);
          }
        ),
      ),
      drawer: const MyDrawer(),
    );

  }
}