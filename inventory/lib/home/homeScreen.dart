import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

  class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  void initState() {
  controller.tabController = TabController(length: 3, vsync: this);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GestureDetector( child: Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(physics: NeverScrollableScrollPhysics(),
          controller: controller.tabController, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("A carregar Inventarios",style: TextStyle(fontFamily:"Bradon"),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("A carregar Items",style: TextStyle(fontFamily:"Bradon"),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("A carregar Pesquisa",style: TextStyle(fontFamily:"Bradon"),),
              ],
            )
          ]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              controller.currentBottomIndex.value = index;
              controller.tabController.animateTo(index);
            });

          },
          currentIndex: controller.currentBottomIndex.value,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.paste_rounded,
                  ),
                  label: "Inventarios"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list), label: "Items"),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.search),
                  label: "Pesquisa")
            ],
          ),
        )
    ),);
  }

}