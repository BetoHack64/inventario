// ignore_for_file: avoid_print, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'dart:io';

import 'package:flutter/material.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';

class HomeTela extends StatefulWidget {
  @override
  State<HomeTela> createState() => Home();
}

class Home extends State<HomeTela> {
  //final viagemController = Get.put(PagamentoController());
  final List<String> _itensMenu = [
    'Computadores',
    'Impressoras',
    'Outros Bens',
  ];
  //icones...
  final List<Icon> _icones = [
   const Icon((Icons.desktop_windows)),
    const Icon((Icons.print)),
     const Icon((Icons.wb_sunny)),
  ];
  //Função que retorna os campos de testos e combo

//Fim funcao campos

//Função que retorna os campos de foto

/* bottomNavigationBar
Widget menuLista() {
    return ListView.builder(
      itemBuilder: (_, i) {
        String nome = _itensMenu[i];
        return  ListTile(
          leading: CircleAvatar(
            child: Text('${nome[0]}'),
          ),
          title: Text('$nome'),
          subtitle: Text("Texto"),
        );
      },
      itemCount: _itensMenu.length,
    );
  }
*/
  //Fim funcao campos de fotos
  Widget menuLista() {
    return ListView.builder(
      itemBuilder: (_, i) {
        String nome = _itensMenu[i];
        return Card(
          child: GestureDetector(
            
            child: ListTile(
                title: Text('$nome'),
                subtitle: const Text("Click sobre ."),
                leading:  CircleAvatar(child: (_icones[i])),
                trailing: const Icon((Icons.arrow_forward))),
          ),
        );
      },
      itemCount: _itensMenu.length,
    );
  }

  //Fim função do data Piker
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Stack(
        children: [
          Image.asset(
            //Estava dentro de um containner
            ImageConstant.fundoAzulBolinha,
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: getVerticalSize(210.0)),
            height: MediaQuery.of(context).size.height,
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsetsDirectional.only(top: getVerticalSize(39.0)),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: menuLista(),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: getVerticalSize(30)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin:
                      EdgeInsetsDirectional.only(end: getHorizontalSize(40)),
                  child: IconButton(
                    onPressed: () {
                      //Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Image.asset(
                  ImageConstant.inventarioImg,
                  fit: BoxFit.fill,
                  // height: 80,
                  width: getHorizontalSize(75),
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(
                        start: getHorizontalSize(60)),
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      size: 24,
                      color: Colors.transparent,
                      //iconSize: 65,
                    ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(top: getVerticalSize(145)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Inventário',
                  style: TextStyle(
                    fontSize: getFontSize(25),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      /* bottomNavigationBar: BottomNavigatorWidget(
        indexMenu: 1,
      ),*/
    );

    // ignore: dead_code
  }
}
