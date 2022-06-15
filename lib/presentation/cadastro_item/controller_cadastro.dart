import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:inventario/controller/controller.dart';
import 'package:inventario/controller/controller_database.dart';
import 'package:inventario/controller/shared_preferences.dart';
import 'package:inventario/main.dart';
import 'package:inventario/model/inventario.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';



class CadastroController{
  int idMax = 0;
  String idSequence = "00000";
  String filePath = "";
  Future<void> getEstadoConsevacao() async{
    controller.estadoConservasao = await DatabaseContriller().getEstadoConservacao();
    controller.localizacao = await DatabaseContriller().getLocalizacao();
    controller.estadoUso = await DatabaseContriller().getEstadoUso();
    controller.categorys = await DatabaseContriller().getCategorys();
    controller.funcionarios = await DatabaseContriller().getFuncionarios();
  }


  Future<void> postInventario(idLocalBens, idCategory,
      idClassifBens, utilizadorBem, descricao, idMarca, idModelo, numSerie,tecnolog,cor, anoAquisicao, anoFabrico, fornecedor,
      idEstadoUso, idEstadoConservacao, observacoes, lastUpdate, Status) async {

    idMax += await DatabaseContriller().getInventarioMaxID()+1;
    int sequence = idSequence.length - idMax.toString().length;
    String numSequence = idSequence.substring(0,sequence);
    int ano = DateTime.now().year;
    int IDusar = CacheController.getData(idKey);
    int nTablet = CacheController.getData(nTableteKey);
    String nip = "$ano$nTablet$numSequence$idMax";

    var newInventario = TabInventario(nip:nip, idLocalBens:idLocalBens, idCategory:idCategory, idClassifBens:idClassifBens, utilizadorBem:utilizadorBem,
        descricao:descricao, idMarca:idMarca, idModelo:idModelo, numSerie:numSerie, tecnolog:tecnolog,cor:cor, anoAquisicao:anoAquisicao, anoFabrico:anoFabrico,
        fornecedor:fornecedor, idEstadoUso:idEstadoUso, idEstadoConservacao:idEstadoConservacao, observacoes:observacoes, idUser:IDusar, lastUpdate:lastUpdate, Status:Status);

    await DatabaseContriller().insertInventario(newInventario).then((value) { controller.nipController.value = nip;});

  }

  Future<void> postImagens(imagens) async{
    await DatabaseContriller().insertImagens(imagens);
  }


    createBackupBD() async {

      final dbFolder = await getDatabasesPath();
      File source1 = File('$dbFolder/inventario.db');

      Directory copyTo =
      Directory("storage/emulated/0/SqliteBackup");
      if ((await copyTo.exists())) {
        // print("Path exist");
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          await Permission.storage.request();
        }
      } else {
        print("not exist");
        if (await Permission.storage.request().isGranted) {
          // Either the permission was already granted before or the user just granted it.
          await copyTo.create();
        } else {
          print('Please give permission');
        }
      }
      String newPath = "${copyTo.path}/inventario.db";
      await source1.copy(newPath);
    }

    restoreBD() async{
      var databasesPath = await getDatabasesPath();
      var dbPath = join(databasesPath, 'inventario.db');

      FilePickerResult? result =
          await FilePicker.platform.pickFiles();
      if (result != null) {
        File source = File(result.files.single.path!);
        await source.copy(dbPath);
      } else {
        // User canceled the picker

      }
    }

}