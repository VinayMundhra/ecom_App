import 'package:catelog/models/catelog.dart';
import 'package:catelog/widgets/drawer.dart';
import 'package:catelog/widgets/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
      appBar: AppBar(
        title: const Text('Catelog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (BuildContext context, int index) {
                  final Item item = CatalogModel.items[index];
                  return Card(
                       clipBehavior: Clip.antiAlias,
                       shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                            ),
                            decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        padding: const EdgeInsets.all(12),
                        ),

                        child: 
                         Image.network(
                           item.image
                           ),

                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black,),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.black54
                            ),
                            ),
                        ));
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
