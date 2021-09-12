import 'package:catelog/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catelog App'
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome Vinay'),
          ),
      ),
      drawer: MyDrawer(),
    );

  }
}