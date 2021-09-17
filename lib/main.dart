import 'package:catelog/pages/cart_page.dart';
import 'package:catelog/pages/home_page.dart';
import 'package:catelog/pages/login_page.dart';
import 'package:catelog/utils/routes.dart';
import 'package:catelog/widgets/themes.dart';
import 'package:flutter/material.dart';
void main()
{
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (BuildContext context)=> const LoginPage(),
        MyRoutes.homeRoute: (context)=> HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }}