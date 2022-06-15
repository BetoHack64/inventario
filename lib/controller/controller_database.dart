import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:inventario/controller/app_database.dart';
import 'dart:convert' as convert;
import 'package:encrypt/encrypt.dart' as encrypt ;

import 'package:inventario/main.dart';
import 'package:inventario/model/inventario.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class DatabaseContriller  {
  Database? db = AppDadabase().getDB();
 static String datanow = "";
 List<String> tables = ['tabusuario','tab_estado_uso','tab_estado_conservacao','tab_localizacao'];
 static const SECRET_KEY = "2022_PRIVATE_KEY";


   Future<List<TabUsar>> getUsuario(String name,String senha) async {
     final List<Map<String, dynamic>> maps = await db!.query('tabusuario',where: 'usuario = ? and senha = ?',whereArgs: [name,senha]);
     return List.generate(maps.length, (i) {
       return TabUsar(IdUser: maps[i]['idUser'],
           usuario: maps[i]['usuario'],
           senha: maps[i]['senha'],
           ntablet: maps[i]['ntablet']);
     });
   }

   insertUsuario(List<TabUsar> tabUsar) async {
       tabUsar.forEach((element) {
         db?.insert(
           'tabusuario',
           element.toMap(),
           conflictAlgorithm: ConflictAlgorithm.replace,
         );
       });
   }


 Future<List<TabEstadoUso>> getEstadoUso() async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_estado_uso');
   return List.generate(maps.length, (i) {
     return TabEstadoUso(idUso: maps[i]['id'],
         codigo: maps[i]['Codigo'],
         descricao: maps[i]['descricao'],
         Status : maps[i]['Status'],
         lastUpdate : maps[i]['lastUpdate']
         );
   });
 }
    insertEstadoUSO(List<TabEstadoUso> estadoUso) async {
   estadoUso.forEach((element) {
     db?.insert(
       'tab_estado_uso',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });

 }

 Future<List<TabEstadoConservacao>> getEstadoConservacao() async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_estado_conservacao');
   return List.generate(maps.length, (i) {
     return TabEstadoConservacao(
         IDConservBens: maps[i]['id'],
         codigo: maps[i]['CodBens'],
          descricao: maps[i]['descricao'],
          lastUpdate :maps[i]['lastUpdate']);
   });
 }

 insertEstadoConservacao(List<TabEstadoConservacao> estadoConservacao) {
   // Get a reference to the database.
   estadoConservacao.forEach((element) {
     db?.insert(
       'tab_estado_conservacao',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }
 Future<List<TabLocalizacao>> getLocalizacao() async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_localizacao');
   return List.generate(maps.length, (i) {
     return TabLocalizacao( IDLocalizacao: maps[i]['id'],
         IDLocalizacaoPai :maps[i]['IDLocalizacaoPai'],
         Codigo : maps[i]['Codigo'],
         UltimoNivel: maps[i]['UltimoNivel'],
         descricao :maps[i]['descricao'],
         morada: maps[i]['morada'],
         porta :maps[i]['porta'],
         andar :maps[i]['andar'],
         localidade :maps[i]['localidade'],
         pais :maps[i]['Pais'],
         provincia:maps[i]['provincia'],
         municipio :maps[i]['municipio'],
         lastUpdate :maps[i]['lastUpdate'],
         Status :maps[i]['Status']);
   });

 }
 insertLocalizacao(List<TabLocalizacao> localizacao) {
   // Get a reference to the database.
   localizacao.forEach((element) {
     db?.insert(
       'tab_localizacao',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 insertCategorys(List<TabCategorys> categorys) {
   categorys.forEach((element) {
     db?.insert(
       'TabCategorys',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 Future<List<TabCategorys>> getCategorys() async {
   final List<Map<String, dynamic>> maps = await db!.query('TabCategorys');
   return List.generate(maps.length, (i) {
     return TabCategorys(ID :maps[i]['id'],
         descricao :maps[i]['Categ_Descricao'],
         Status :maps[i]['Status'],
         lastUdate :maps[i]['lastUpdate']);
   });
 }


 insertClassifBens(List<TabClassifiacaoBens> classifBens) {
   classifBens.forEach((element) {
     db?.insert(
       'tab_classificacao_bens',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 Future<List<TabClassifiacaoBens>> getClassifBens(int IDCategory) async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_classificacao_bens', where: 'IDCategory = ?',whereArgs: [IDCategory]);
   //final List<Map<String, dynamic>> map = await db!.query('tab_imagens',where: 'ID_Nip = ?',whereArgs: [2022100003]);

   return List.generate(maps.length, (i) {
     return TabClassifiacaoBens(idClassifBens: maps[i]['id'],
         IDCategory: maps[i]['IDCategory'],
         descricao: maps[i]['descricao'],
         Status: maps[i]['Status'],
         lastUpdate: maps[i]['lastUpdate']);
   });
 }

 insertMarca(List<TabMarca> marcas) {
   // Get a reference to the database.
   marcas.forEach((element) {
     db?.insert(
       'tab_marca',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 Future<List<TabMarca>> getMarcas(int IDCategory) async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_marca', where: 'IDCategory = ?',whereArgs: [IDCategory]);
   return List.generate(maps.length, (i) {
     return TabMarca(idMarca: maps[i]['IDMarca'],
         IDCategory: maps[i]['IDCategory'],
         descricao: maps[i]['descricao'] ,
         Status: maps[i]['Status'],
         lastUpdate: maps[i]['lastUpdate']);
   });
 }

 insertModelo(List<TabModelo> modelos) {
   // Get a reference to the database.
   modelos.forEach((element) {
     db?.insert(
       'tab_modelo',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 Future<List<TabModelo>> getModelos(String IDMarca) async {
   final List<Map<String, dynamic>> map = await db!.query('tab_marca', where: 'descricao = ?',whereArgs: [IDMarca]);
   int id = map[0]['IDMarca'];
   controller.idMarca.value = id;
   final List<Map<String, dynamic>> maps = await db!.query('tab_modelo', where: 'IDMarca = ?',whereArgs: [id]);
   return List.generate(maps.length, (i) {
     return TabModelo(idModelo: maps[i]['IDModelo'],
         MarcaID: maps[i]['IDMarca'],
         descricao: maps[i]['descricao'] ,
         Status: maps[i]['Status'],
         lastUpdate: maps[i]['lastUpdate']);
   });
 }

  Future<void> getIDModelos(String DescModelo) async {
    final List<Map<String, dynamic>> maps = await db!.query('tab_modelo', where: 'descricao = ?',whereArgs: [DescModelo]);
    int id = maps[0]['IDModelo'];
    controller.idModelo.value = id;
  }

 insertFuncionarios(List<TabFuncionarios> funcionarios) {
   // Get a reference to the database.
   funcionarios.forEach((element) {
     db?.insert(
       'tab_funcionarios',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }

 Future<List<TabFuncionarios>> getFuncionarios() async {
   final List<Map<String, dynamic>> maps = await db!.query('tab_funcionarios');
   print(maps);
   return List.generate(maps.length, (i) {
     return TabFuncionarios(IDFuncionario: maps[i]['id'],
         NumFuncionario: maps[i]['NumFuncionario'],
         name: maps[i]['name'] ,
         Status: maps[i]['Status'],
         lastUpdate: maps[i]['lastUpdate']);
   });
 }



 Future<void> insertInventario(TabInventario inventario) async {
   await db?.insert(
       'tab_inventario',
       inventario.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
 }

  int id = 0;
  Future<int> getInventarioMaxID() async {
    final List<Map<String, dynamic>> map = await db!.query('tab_inventario');
    if(!map.isEmpty && map.length>0){
      id = map[map.length -1]['id'];
    }else {
      id =0;
    }
    return id;
  }
 
 insertImagens(List<TabImagens> imagens) {
   // Get a reference to the database.
   imagens.forEach((element) {
     db?.insert(
       'tab_imagens',
       element.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,
     );
   });
 }
 userInsert(List<TabUsar> tabuser) async{
   await insertUsuario(tabuser);
   }


  Future<String> generateBackup ({bool isEncriptd = true}) async{
     var dbs = await db;
     List data = [];
     List<Map<String,dynamic>> listMaps = [];
     for(var i =0; i<tables.length;i++){
       listMaps = await dbs!.query(tables[i]);

       data.add(listMaps);
     }
     List backups = [tables, data];
     String json = convert.jsonEncode(backups);
      print(json);
     if(isEncriptd)
     {

       var key = encrypt.Key.fromUtf8(SECRET_KEY);
       var iv = encrypt.IV.fromLength(16);
       var encrypter = encrypt.Encrypter(encrypt.AES(key));
       var encrypted = encrypter.encrypt(json, iv: iv);

       return encrypted.base64;
     }
     else
     {
       return json;
     }
     return json;
  }

    //await insertTabSerie(tabserie);
   // dado = await getUsuario();
   // Controller.user = dado;
   // print(await NumSerie());

}




