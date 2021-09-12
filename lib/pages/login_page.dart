import 'package:catelog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 String name="";
 bool changebutton= false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/Login_image.png', 
            fit: BoxFit.cover,
            ),
      
            const SizedBox(
              height: 20.0,
              child: Text('Hey!!'),
            ),
      
            Text('Welcome $name',
            style: const TextStyle(
              fontSize: 24,
            fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter user name',
                      labelText: 'Username',
                    ),
                    onChanged: (String value) {
                      name= value;
                      setState(() {});},
                  ),
                   TextFormField(
                     obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      labelText: 'Password',
                      ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async{
                     setState(() {
                       changebutton =true;
                     });
                     await Future<dynamic>.delayed(const Duration(seconds: 1));
                     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changebutton? 50: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton ? const Icon(
                        Icons.done,
                        color: Colors.white)
                        : const Text(
                        'Login', 
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      // shape: changebutton ? BoxShape.circle : BoxShape.rectangle,
                       borderRadius: BorderRadius.circular(changebutton? 50:8),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   child: const Text('Login'),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: const Size(150, 50)),
                  //   onPressed: (){
                  //     Navigator.pushNamed(context,MyRoutes.homeRoute);
                  //     }, 
                  //  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}