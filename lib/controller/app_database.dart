import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDadabase {
  static Database? _db;

  // Factory constructor
  factory AppDadabase() {
    return AppDadabase._();
  }

  // Generative constructor
  AppDadabase._();

  Database? getDB() {
    return _db;
  }

  Future<void> init() async {
    var documentDirectory = await getDatabasesPath();
    final path = join(documentDirectory, 'inventario.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (newDb, version) async {
        print('===');
        print('openDatabase: onCreate called');
       await newDb.execute(
            'CREATE TABLE tabusuario (idUser INTEGER PRIMARY KEY autoincrement, usuario TEXT, senha TEXT, ntablet INTEGER)');
        await newDb.execute(
            'CREATE TABLE TabCategorys (id INTEGER PRIMARY KEY autoincrement, Categ_Descricao TEXT, Status INTEGER,lastUpdate TEXT)');
        await  newDb.execute(
            'CREATE TABLE tab_estado_uso (id INTEGER PRIMARY KEY autoincrement,Codigo INTEGER, descricao TEXT, Status INTEGER, lastUpdate TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_estado_conservacao (id INTEGER PRIMARY KEY autoincrement, CodBens INTEGER, descricao TEXT, Status INTEGER, lastUpdate TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_localizacao (id INTEGER PRIMARY KEY autoincrement,IDLocalizacaoPai INTEGER, Codigo TEXT, UltimoNivel INTEGER, descricao TEXT,morada TEXT, porta INTEGER, andar INTEGER, localidade TEXT, Pais TEXT, provincia TEXT,municipio TEXT, lastUpdate TEXT, Status INTEGER)');
        await newDb.execute(
            'CREATE TABLE tab_classificacao_bens (id INTEGER PRIMARY KEY autoincrement, IDCategory INTEGER, descricao TEXT, Status INTEGER, lastUpdate, TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_marca (IDMarca INTEGER PRIMARY KEY autoincrement, IDCategory INTEGER, descricao TEXT, Status INTEGER, lastUpdate, TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_modelo (IDModelo INTEGER PRIMARY KEY autoincrement, IDMarca INTEGER, descricao TEXT, Status INTEGER, lastUpdate, TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_funcionarios (id INTEGER PRIMARY KEY autoincrement, NumFuncionario INTEGER, name TEXT, Status INTEGER, lastUpdate, TEXT)');
        await newDb.execute(
            'CREATE TABLE tab_inventario (id INTEGER PRIMARY KEY autoincrement, nip TEXT, IDLLocalizacao INTEGER, IDCategoty INTEGER, IDClassifBens INTEGER, utilizadorBem TEXT, descricao TEXT, IDMarca INTEGER, IDModelo INTEGER, numSerie INTEGER, tecnolog TEXT, cor TEXT, anoAquisicao TEXT, anoFabrico TEXT, fornecedor TEXT, idEstadoUso INTEGER, idEstadoConsevacao INTEGER, observacao TEXT, idUser INTEGER, lastUpdate TEXT, Status INTEGER)');
        await newDb.execute(
            'CREATE TABLE tab_imagens (id INTEGER PRIMARY KEY autoincrement, ID_Nip INTEGER, imagem TEXT, Status INTEGER, lastUpdate, TEXT)');
        print('openDatabase: Database created!');
        print('===');
      },
    );
  }

  Future<void> deleteBD() async{
    await deleteDatabase('inventario.db');
  }

  Future close() async {
   await _db!.close();
  }

}