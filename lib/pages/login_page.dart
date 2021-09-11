import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/Login_image.png', 
          fit: BoxFit.cover,
          ),

          SizedBox(
            height: 20.0,
            child: Text('Hey!!'),
          ),

          Text('Welcome',
          style: TextStyle(
            fontSize: 24,
          fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter user name",
                    labelText: "Username"
                  ),
                ),
                 TextFormField(
                   obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    labelText: "Password",
                    ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(),
                  onPressed: (){
                    print('Working');
                  }, 
                  child: Text(
                    'Login')
                    )
              ],
            ),
          )
        ],
      )
    );
  }
}