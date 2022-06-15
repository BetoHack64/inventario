import 'package:get/get.dart';
import 'package:inventario/model/inventario.dart';




class Controllers extends GetxController {
  TabUsar usar = TabUsar();
  List<TabEstadoConservacao> estadoConservasao =[];
  List<TabLocalizacao> localizacao =[];
  List<TabEstadoUso> estadoUso =[];
  List<TabUsar> usuarios =[];
  List<TabClassifiacaoBens> templets = [];
  List<TabCategorys> categorys = [];
  List<TabMarca> marca = [];
  List<TabModelo> modelo = [];
 RxInt idClassifBens = 0.obs;
 RxString  nipController ="".obs;
 RxInt idMarca = 0.obs;
 RxInt idModelo = 0.obs;
 List<TabFuncionarios> funcionarios = [];
}