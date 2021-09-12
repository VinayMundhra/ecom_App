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
 final _formkey= GlobalKey<FormState>();

 dynamic moveToHome(BuildContext context) async{
   if(_formkey.currentState!.validate()){
   setState(() {
                           changebutton =true;
                         });
                         await Future<dynamic>.delayed(const Duration(seconds: 1));
                         await Navigator.pushNamed(context, MyRoutes.homeRoute);
                         setState(() {
                           changebutton =false;
                         });
 }}
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'Username cannnot be empty';
                        }
                        return null;
                      },
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
                         validator: (String? value){
                        if(value!.isEmpty){
                          return 'Please fill the password';
                        }
                        else if(value.length <6){
                          return 'Password is weak. Please enter atleast 6 digit password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changebutton? 50:8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
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
                          
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}