import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventario/controller/constants.dart';
import 'package:inventario/controller/controller_database.dart';
import 'package:inventario/controller/shared_preferences.dart';
import 'package:inventario/presentation/Login/tela_login.dart';
import 'package:inventario/presentation/cadastro_item/controller_cadastro.dart';
import 'package:inventario/presentation/cadastro_item/tela_cadastro.dart';

class ScreenSplash extends StatefulWidget {
  ScreenSplash({Key? key}) : super(key: key);

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {


  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if(CacheController.getData(loggedKey) == null ) {
       /* DatabaseContriller().userInsert(Constants.tabuser);
        DatabaseContriller().insertEstadoConservacao(Constants.listEstadoConservacao);
        DatabaseContriller().insertEstadoUSO(Constants.listEstadoUso);
        DatabaseContriller().insertLocalizacao(Constants.listLocalizacao);
        DatabaseContriller().insertCategorys(Constants.listCategory);
        DatabaseContriller().insertClassifBens(Constants.listClassifBens);
        DatabaseContriller().insertMarca(Constants.listMarca);
        DatabaseContriller().insertModelo(Constants.listModelo);
        DatabaseContriller().insertFuncionarios(Constants.listFuncionarios); */
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()),);
      }else {

        Navigator.push(context, MaterialPageRoute(builder: (context) => Cad_inventario()),);
      }
      //Navigator.of(context).popAndPushNamed('/tela_splash');

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[

              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightGreen[50],
                  valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF608EE9)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
