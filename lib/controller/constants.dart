
import 'package:intl/intl.dart';
import 'package:inventario/controller/shared_preferences.dart';
import 'package:inventario/model/inventario.dart';

class Constants {

 static String datanow = "";
 getDataTime(){
  final DateFormat formatt = DateFormat('dd-MM-yyyy');
  String formatted = formatt.format(DateTime.now());
  datanow = formatted.toString();
 }



 String get apiBaseUrl => "http://192.168.56.32:8090/api/SGP";

 String get apiUrlToken => "http://83.240.225.239:130/token";

 var RequestHeader=({
  "Accept": "*/*",
  "content-type": "application/json",
  "Authorization": "Bearer ${CacheController.getData(token)}"
 });

 }


 /*static List<TabUsar> tabuser = [
  TabUsar(usuario: "Filomena",senha: "1234",ntablet: 1),
  TabUsar(usuario: "Silvio",senha: "123",ntablet: 2),
  TabUsar(usuario: "Bruno",senha: "12345",ntablet: 3)];


 static List<TabFuncionarios> listFuncionarios = [
  TabFuncionarios(NumFuncionario: 001,name: "Edilson Mota",lastUpdate:DateTime.now().toString(),Status: 1),
  TabFuncionarios(NumFuncionario: 002,name: "Mario Gomes",lastUpdate:DateTime.now().toString(),Status: 1),
  TabFuncionarios(NumFuncionario: 003,name: "Jardel Cabral",lastUpdate:DateTime.now().toString(),Status: 1),
  TabFuncionarios(NumFuncionario: 004,name: "Filomena Pascoal",lastUpdate:DateTime.now().toString(),Status: 1),
  TabFuncionarios(NumFuncionario: 005,name: "Silvio Francisco",lastUpdate:DateTime.now().toString(),Status: 1),
  TabFuncionarios(NumFuncionario: 006,name: "Bruno Sandande",lastUpdate:DateTime.now().toString(),Status: 1),
  ];

 static List<TabEstadoUso> listEstadoUso = [
  TabEstadoUso(codigo: 2,descricao: "Novo",Status: 0,lastUpdate: DateTime.now().toString()),
  TabEstadoUso(codigo: 3,descricao: "Segunda mao",Status: 0,lastUpdate: DateTime.now().toString())];

 static List<TabEstadoConservacao> listEstadoConservacao = [TabEstadoConservacao(codigo: 1,descricao: "Bom",Status: 0,lastUpdate: DateTime.now().toString()),
  TabEstadoConservacao(codigo: 1,descricao: "Mau",Status: 0,lastUpdate: DateTime.now().toString()),TabEstadoConservacao(codigo: 1,descricao: "Razoavel",Status: 0,lastUpdate: DateTime.now().toString()),
  TabEstadoConservacao(codigo: 1,descricao: "Inativo",Status: 0,lastUpdate: DateTime.now().toString()),TabEstadoConservacao(codigo: 1,descricao: "Desconhecido",Status: 0,lastUpdate: DateTime.now().toString())];

 static List<TabLocalizacao> listLocalizacao = [
  TabLocalizacao(IDLocalizacaoPai: 1,Codigo: "244",UltimoNivel: 1,descricao: "Edifício Dipanda; 7 andar, porta nº8 ",morada: "Maculusso, Vila Alice",porta: 8,andar: 7,localidade: "Largo da independencia",pais: "Angola",provincia: "Luanda",municipio: "Maculusso",lastUpdate:DateTime.now().toString(),Status: 0 ),
  TabLocalizacao(IDLocalizacaoPai: 1,Codigo: "244",UltimoNivel: 1,descricao: "Edifício Dipanda; 8ª andar, porta nº9 ",morada: "Maculusso, Vila Alice",porta: 9,andar: 8,localidade: "Largo da independencia",pais: "Angola",provincia: "Luanda",municipio: "Maculusso",lastUpdate:DateTime.now().toString(),Status: 0 ),
  TabLocalizacao(IDLocalizacaoPai: 2,Codigo: "244",UltimoNivel: 1,descricao: "Edifício IMOB",morada: "Major Konhangulo; 6 andar, porta nº11",porta: 11,andar: 6,localidade: "Largo da independencia",pais: "Angola",provincia: "Luanda",municipio: "Major Konhangulo",lastUpdate:DateTime.now().toString(),Status: 0 )];

 static List<TabCategorys> listCategory = [TabCategorys(descricao: "Equipamentos de Impressão",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Computadores Pessoais",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Servidores",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Telefones Fixos VOIP ",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Equipamentos Comunicação de Dados",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Equipamentos Multimédia",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Mobiliário e Equipamentos Administrativo",Status: 0,lastUdate: DateTime.now().toString()),
  TabCategorys(descricao: "Equipamentos de Energia",Status: 0,lastUdate: DateTime.now().toString())];

 static List<TabClassifiacaoBens> listClassifBens = [TabClassifiacaoBens(IDCategory: 1,descricao: "Impressoras",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 1,descricao: "Impressoras de Etiquetas",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 1,descricao: "Multifunções",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 1,descricao: "Fotocopiadoras",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 1,descricao: "Scanner",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 2,descricao: "Computadores Secretaria (Desktops)",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 2,descricao: "Computadores Portáteis",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 2,descricao: "Tablets ",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 5,descricao: "Activos - router",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 5,descricao: "Passivos - switch",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 5,descricao: "Bastidores ",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 6,descricao: "Ecrãs",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 6,descricao: "Monitores auxiliares",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 6,descricao: "Projectores",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Secretarias",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Cadeiras",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Mesas",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Sofás",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Armários",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Objectos de Arte",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Electro domésticos",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 7,descricao: "Quadros Trabalho",Status: 0,lastUpdate: DateTime.now().toString()),
  TabClassifiacaoBens(IDCategory: 8,descricao: "UPS",Status: 0,lastUpdate: DateTime.now().toString())];


 static List<TabMarca> listMarca = [
  TabMarca(IDCategory: 1,descricao: "Epson",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "HP",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Brother",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Elgin",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Fujifilm",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Lexmark",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Canon",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Zebra",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Argox",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 1,descricao: "Xerox",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "HP",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "DELL",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "LENOVO",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "ACER",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "TOSHIBA",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "IBM",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "NEC",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "FUJITSU",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 2,descricao: "GATEWAY COMPUTER",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "HPE",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "DELL",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "IBM",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "SuperMicro",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "LENOVO",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "Intel",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "Cisco",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "Oracle",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "Huawei",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 3,descricao: "Inspur Electronics",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Cisco",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Alcatel",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Grandstream",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Panasonic",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Gigaset Maxwell C",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Snom",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Poly",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Unidata INCOMINC",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 4,descricao: "Yealink",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Huawei",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Cisco",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Dell",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Aruba",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Nutanix",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "NVIDIA",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "Juniper",Status: 0,lastUpdate: DateTime.now().toString()),
  TabMarca(IDCategory: 5,descricao: "VMware",Status: 0,lastUpdate: DateTime.now().toString()),
 ];

 static List<TabModelo> listModelo = [
  TabModelo(MarcaID: 1,descricao: "L3150 Ecotank Wireless",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 1,descricao: "L3110 Ecotank",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 1,descricao: "Brother",Status: 0,lastUpdate: DateTime.now().toString()),
 // TabModelo(MarcaID: 1,descricao: "",Status: 0,lastUpdate: DateTime.now().toString()),
 // TabModelo(MarcaID: 1,descricao: "FUJITSU",Status: 0,lastUpdate: DateTime.now().toString()),
  // Modelos da marca HP
  TabModelo(MarcaID: 2,descricao: "ProDesk 600 GI",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "Compaq 8200",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "EliteBook Folio9480M",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "EliteBook 8470P",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "HP Laser",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "Deskjet Plus Ink Advantage",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "HP Office Jet Pro",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "HP Neverstop Laser",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 2,descricao: "HP Smart Tank",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J6940DW",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J5740DW",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J6540DW",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J5340DW",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J59550DW",Status: 0,lastUpdate: DateTime.now().toString()),
  TabModelo(MarcaID: 3,descricao: "MFC-J69550DW",Status: 0,lastUpdate: DateTime.now().toString()),
];*/
