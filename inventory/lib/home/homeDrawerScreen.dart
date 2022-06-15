import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/home/homeScreen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color(0xff00c5d0),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( title,style: TextStyle(fontFamily:"Bradon"),),
          ],
        ),
      ),
      body: Home(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff00c5d0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.only(top: Get.height * .02, left: Get.width * .03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.person,
                                color: const Color(0xff00c5d0),
                              ),
                              backgroundColor: Colors.white,
                              radius: Get.height * 0.06,
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Text("Tablet1",style: TextStyle(fontFamily:"Bradon",color: Colors.white,fontSize: 18))

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Luanda, rua Hoji ya henda",style: TextStyle(fontFamily:"Bradon",color: Colors.white,fontSize: 16)),
                      ],)
                ],)
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}