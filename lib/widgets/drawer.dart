import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageUrl = 
    'https://media-exp1.licdn.com/dms/image/C5603AQGtRgrU7oxiDA/profile-displayphoto-shrink_200_200/0/1623148255446?e=1632355200&v=beta&t=DcZfs1rDZWemBA2zdFOf7PHmnzg4NR6DNh6lWOvpHWI';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Vinay Mundhra'),
                accountEmail: Text('vmundha1199@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              )
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  'Profile',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  'Email me',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
          ],
        ),
      )
    );
  }
}