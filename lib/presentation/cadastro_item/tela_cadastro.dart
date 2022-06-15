// ignore_for_file: avoid_print, use_key_in_widget_constructors, deprecated_member_use, unused_field, camel_case_types

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventario/controller/constants.dart';
import 'package:inventario/controller/controller.dart';
import 'package:inventario/controller/controller_database.dart';
import 'package:inventario/main.dart';
import 'package:inventario/presentation/cadastro_item/combobox_bens.dart';
import 'package:inventario/presentation/cadastro_item/combos.dart';
import 'package:inventario/presentation/cadastro_item/controller_cadastro.dart';
import 'package:inventario/presentation/cadastro_item/impressao/tela_print.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../model/inventario.dart';
import '../../utils/autocompletar.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/math_utils.dart';

class Cad_inventario extends StatefulWidget {
  @override
  State<Cad_inventario> createState() => CadastroInventario();
}

// ignore: duplicate_ignore
class CadastroInventario extends State<Cad_inventario> {
  //final viagemController = Get.put(PagamentoController());
  bool avancar = false;
  String numTab = "001";
  int selectedStep = 1;
  DateTime selectedDate = DateTime.now();
  String dataNascimento = "";
  final dataa = TextEditingController();
  bool contro = false;
  String selectedCat = '0';
  String selecteModelo = '0';
  String selecteMarca = '0';
  String selectedCores = '0';
  String selectedCat2 = '0';
  String selectUtentes = '0';
  String selectedEstadoUso = '0';
  String selectedConserva = '0';
  String selectedLocale = '0';
  final agora = DateTime.now();
  String seQ = "000112";
//Controllers das var
  final descricao = TextEditingController();
  final anoAquisicao = TextEditingController();
  final anoFabrico = TextEditingController();
  final numSerie = TextEditingController();
  final tecnologia = TextEditingController();
  final fornecedor = TextEditingController();
  final obs = TextEditingController();
//Váriaveis
  String obs_ = "";
  String preco_ = "";
  String numSerie_ = "0";
  String tecnologia_ = "";
  String marca_ = "";
  String fornecedor_ = "";
  String anoAquisicao_ = "";
  String anoFabrico_ = "";
  String descricao_ = "";
  bool isIpc = false;
  bool isIpc4 = false;
  bool isIpc3 = false;
  bool isIpc5 = false;
  File? _image;
  File? _image1;
  File? _image3;
  File? _image4;
  File? _image5;
  bool connected = false;
  List availableBluetoothDevices = [];
  //Imagengens convertidas
  String? img64;
  String? img64_1;
  String? img64_2;
  String? img64_3;
  String? img64_4;
 // final List<String> _sugEstaoCores = [];
  final List<String> _sugEstaoMarca = [];
  final List<String> _sugEstaoModelo = [];
  final List<String> _sugestFornecedores = [
    'Tobe SI',
    'Omatapalo Lda',
    'Indian Angola SA',
    'Chevrom Mobil',
    'Kibabo',
    'Angola tradding ',
    'Primavera Corporation SA '
  ];

  final List<String> _sugEstaoCores = [
    'Preto',
    'Branco',
    'Cinza',
    'Vermelho',
    'Azul'];

  setInsertInventario() async {
    await CadastroController().postInventario(
        int.parse(selectedLocale),
        int.parse(selectedCat),
        controller.idClassifBens.value,
        selectUtentes,
        descricao_,
        controller.idMarca.value,
        controller.idModelo.value,
        int.parse(numSerie_),
        tecnologia_,_selectedCor,
        anoAquisicao_,
        anoFabrico_,
        _selectedFornecedor,
        int.parse(selectedEstadoUso),
        int.parse(selectedConserva),
        obs_,
        DateTime.now().toString(),
        0).then((value) {

    });
    Get.forceAppUpdate();
  }

  Future<void> setClassifBens(int idCateg) async {
    DatabaseContriller().getClassifBens(idCateg).then((value) {
      controller.templets.clear();
      controller.templets = value;
      Get.forceAppUpdate();
    });
    DatabaseContriller().getMarcas(idCateg).then((value) {
      _sugEstaoMarca.clear();
      controller.marca = value;
      controller.marca.forEach((element) {
        _sugEstaoMarca.add(element.descricao);
      });
      Get.forceAppUpdate();
    });

  }

  Future<void> setModelo(String marca) async {
    // Controllers.templets.clear();
    DatabaseContriller().getModelos(marca).then((value) {
      _sugEstaoModelo.clear();
      controller.modelo = value;
      controller.modelo.forEach((element) {
        _sugEstaoModelo.add(element.descricao);
      });

      Get.forceAppUpdate();
    });
  }


  @override
  void initState() {
    super.initState();
  }

  String? _selectedAnimal;
  String? _selectedModelo;
  String _selectedCor ="";
  String? _selectedFornecedor;
  final imagePicke = ImagePicker();
  //Função que pega a imagem da camera_alt_sharp
  Future getImage() async {
    final image = await imagePicke.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
      final bytes = _image!.readAsBytesSync();
      img64 = base64Encode(bytes);
    });
  }

  Future getImage1() async {
    final image1 = await imagePicke.getImage(source: ImageSource.camera);

    setState(() {
      _image1 = File(image1!.path);
      final bytes = _image!.readAsBytesSync();
      img64_1 = base64Encode(bytes);
    });
  }

  Future getImage3() async {
    final image3 = await imagePicke.getImage(source: ImageSource.camera);

    setState(() {
      _image3 = File(image3!.path);
      final bytes = _image!.readAsBytesSync();
      img64_2 = base64Encode(bytes);
    });
  }

  Future getImage4() async {
    final image4 = await imagePicke.getImage(source: ImageSource.camera);

    setState(() {
      _image4 = File(image4!.path);
      final bytes = _image!.readAsBytesSync();
      img64_3 = base64Encode(bytes);
    });
  }

  Future getImage5() async {
    final image5 = await imagePicke.getImage(source: ImageSource.camera);

    setState(() {
      _image5 = File(image5!.path);
      final bytes = _image!.readAsBytesSync();
      img64_4 = base64Encode(bytes);
    });
  }
/////////////////////////////////////-----------------------------------

  Widget campoImpressora() {
    return
        //Container para descrição
        Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 74,
                ),
                child: Text(
                  "Tecnologia",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 10,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: TextField(
                onChanged: (tecnologia) {
                  tecnologia_ = tecnologia;
                },
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: getFontSize(12),
                    fontFamily: 'Inter-Medium'),
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Container Marca
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 145,
                ),
                child: Text(
                  "Cor",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

           /* Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 105,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),*/

            ///
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                //padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Autocompletar<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty

                    if (value.text.isEmpty) {
                      return [];
                    }
                    // The logic to find out which ones should appear
                    return _sugEstaoCores.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedCor = value;

                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget camposEdicao() {
    return Column(
      children: [
        Row(children: []),
        //Combo para seleção da Localização do Bem
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Localizacao",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 21,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            ///
            Container(
              margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  left: 32,
                  right: 32),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                width: size.width,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  //focusNode:viagemController.,
                  hint: Center(
                    child: Text(
                      'Selecione o estado',
                      style: TextStyle(
                          color: Colors.white, fontSize: getFontSize(12)),
                    ),
                  ),
                  value: selectedLocale,
                  items: listaLocais,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                  iconSize: 25,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? selectedValue) => {
                    if (selectedValue is String)
                      {
                        setState(() {
                          selectedLocale = selectedValue;
                        })
                      }
                  },
                ),
              ),
            ),
          ],
        ),

        //Combo para seleção da Categoria
        SizedBox(
          height: getVerticalSize(13),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 7,
                ),
                child: Text(
                  "Categoria",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 0,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 1,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  left: 75,
                  right: 32),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                width: size.width,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  //focusNode:viagemController.,
                  hint: const Center(
                    child: Text(
                      'Selecione o estado',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  value: selectedCat,
                  items: listCat2,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                  iconSize: 25,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? selectedValue) => {

                    if (selectedValue is String)
                      {
                        setState(() {
                          selectedCat = selectedValue;
                          var id = int.parse(selectedCat);
                          setClassifBens(id);
                        })
                      }
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(13),
        ),
        //Combo para seleção da Categoria
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Classificacao",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 6,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 1,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  left: 35,
                  right: 32),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                  width: size.width,
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  alignment: Alignment.center,
                  child: ClassifBens(controller.templets,selectedCat2)),
            ),
          ],
        ),
        //Utilizador do Bem
        SizedBox(
          height: getVerticalSize(13),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 7,
                ),
                child: Text(
                  "Utilizador",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  left: 76,
                  right: 32),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                width: size.width,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  //focusNode:viagemController.,
                  hint: Center(
                    child: Text(
                      'Selecione o estado',
                      style: TextStyle(
                          color: Colors.white, fontSize: getFontSize(12)),
                    ),
                  ),
                  value: selectUtentes,
                  items: listaUtilizadores,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                  iconSize: 25,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? selectedValue) => {
                    if (selectedValue is String)
                      {
                        setState(() {
                          selectUtentes = selectedValue;

                          print(selectUtentes);
                        })
                      }
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Container para descrição
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 8,
                ),
                child: Text(
                  "Descrição",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 75,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: TextField(
                onChanged: (descricao) {
                  descricao_ = descricao;
                },
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: getFontSize(12),
                    fontFamily: 'Inter-Medium'),
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Container Marca
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Marca",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 105,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color:(selectedCat == "7")? Colors.transparent:Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            ///
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                //padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Autocompletar<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty

                    if (value.text.isEmpty) {
                      return [];
                    }
                    // The logic to find out which ones should appear
                    return _sugEstaoMarca.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedAnimal = value;
                      setModelo(_selectedAnimal!);
                    });
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Container Modelo
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Modelo",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 95,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color:(selectedCat == "7")? Colors.transparent:Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),

            ///
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                //padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Autocompletar<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty

                    if (value.text.isEmpty) {
                      return [];
                    }

                    // The logic to find out which ones should appear
                    return _sugEstaoModelo.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedModelo = value;
                      DatabaseContriller().getIDModelos(value);
                    });
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),

        //cont formato pagina
        /* if (selectedCat != 'pc') campoImpressora(),
        if (selectedCat != 'pc')
          SizedBox(
            height: getVerticalSize(13),
          ),*/

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 5,
                ),
                child: Text(
                  "Número Serie",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 18,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: (selectedCat == "7")? Colors.transparent:Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 66,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: TextField(
                onChanged: (numSerie) {
                  numSerie_ = numSerie;
                },
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: getFontSize(12),
                    fontFamily: 'Inter-Medium'),
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),
        //fim Numero de serie
        SizedBox(
          height: getVerticalSize(13),
        ),

        (selectedCat == "1")
            ? campoImpressora()
            :Container(),

        (selectedCat == "1")?
        SizedBox(
          height: getVerticalSize(13),
        ):Container(),
            //Container Ano de Aquisição
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 38,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        //top: getVerticalSize(top),
                        right: 54,
                      ),
                      child: Text(
                        "Ano Aquisição",
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: getFontSize(14),
                            fontFamily: 'Inter-Medium'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 38,
                      //right: 38,
                    ),
                    width: MediaQuery.of(context).size.height * 0.333,
                    height: 44,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1D98C4),
                          Color(0xff1D60C4),
                        ],
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (anoAquisicao) {
                        anoAquisicao_ = anoAquisicao;
                      },
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: getFontSize(12),
                          fontFamily: 'Inter-Medium'),
                      textAlign: TextAlign.justify,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: getVerticalSize(13),
        ),

        //Container Ano de Aquisição
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 70,
                ),
                child: Text(
                  "Ano Fabrico",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (anoFabrico) {
                  anoFabrico_ = anoFabrico;
                },
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: getFontSize(12),
                    fontFamily: 'Inter-Medium'),
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),

        //Campo Fornecedor
        SizedBox(
          height: getVerticalSize(13),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 76,
                ),
                child: Text(
                  "Fornecedor",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                //padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Autocompletar<String>(
                  optionsBuilder: (TextEditingValue value) {
                    // When the field is empty

                    if (value.text.isEmpty) {
                      return [];
                    }

                    // The logic to find out which ones should appear
                    return _sugestFornecedores.where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(value.text.toLowerCase()));
                  },
                  onSelected: (value) {
                    setState(() {
                      _selectedFornecedor = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        //fim fornecedor

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Combo para seleção da Estado de conservação
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Estado conservação",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 1,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 18,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 2,
                right: 32,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                width: size.width,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  //focusNode:viagemController.,
                  hint: const Center(
                    child: Text(
                      'Selecione o estado',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  value: selectedConserva,
                  items: listaEstadoCons,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                  iconSize: 25,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? selectedValue) => {
                    if (selectedValue is String)
                      {
                        setState(() {
                          selectedConserva = selectedValue;
                          print(selectedConserva);
                        })
                      }
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Combo para seleção da Estado de conservação
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 10,
                ),
                child: Text(
                  "Estado aquisicao",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 28,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 18,
                ),
                child: Text(
                  "*",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 2,
                right: 32,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: Container(
                width: size.width,
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  //focusNode:viagemController.,
                  hint: const Center(
                    child: Text(
                      'Selecione o estado',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  value: selectedEstadoUso,
                  items: listaEstadoUso,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                  iconSize: 25,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? selectedValue) => {
                    if (selectedValue is String)
                      {
                        setState(() {
                          selectedEstadoUso = selectedValue;
                        })
                      }
                  },
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Camo obsevação
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 76,
                ),
                child: Text(
                  "Observação",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.333,
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: TextField(
                onChanged: (obs) {
                  obs_ = obs;
                },
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: getFontSize(12),
                    fontFamily: 'Inter-Medium'),
                textAlign: TextAlign.justify,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),

        //Autocompleta texto teste

        SizedBox(
          height: getVerticalSize(13),
        ),
        //Camo obsevação

        //Final de teste autocompleta

        //Final aQui DAS INFO a Carregar a desenho dos botões
        SizedBox(
          height: getVerticalSize(13),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: getHorizontalSize(99),
              height: getVerticalSize(40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shape: const StadiumBorder(),
                  primary: const Color(0xFF1D98C4),
                  shadowColor: const Color(0xFF1D98C4),
                  elevation: 9,
                ),
                onPressed: () {
                  setInsertInventario();
                  setState(() {
                    avancar = true;
                  });

                  print(agora.year.toString());
                  showMaterialModalBottomSheet(
                    expand: false,
                    context: context,
                    builder: (context) =>
                        PrintModal(agora.year.toString() + numTab + seQ),
                  );
                },
                child: Text(
                  'Avançar',
                  style: TextStyle(
                    fontSize: getFontSize(16),
                    fontFamily: 'Inter-ExtraLight',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Fim dos Botões
      ],
    );
  }
//Fim funcao campos

//Função que retorna os campos de foto
  Widget fotos() {

    return Column(
      children: [
        Center(
            child: Text(
          "NIP: ${controller.nipController.value}",
          style: TextStyle(color: Colors.black),
        )),
        SizedBox(
          height: getVerticalSize(13),
        ),
        //ContainerSteps(),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 48,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 89,
                ),
                child: Text(
                  "Foto  bem",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            //Vai ter a s op de img_

            Container(
              width: MediaQuery.of(context).size.height * 0.36,
              height: 310,
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                right: 2,
                left: 20,
              ),
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 38,
                      //right: 38,
                    ),
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: 310,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1D98C4),
                          Color(0xff1D60C4),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: (_image == null)
                            ? const Icon(
                                Icons.camera_alt_sharp,
                                size: 94,
                                color: Colors.black38,
                              )
                            : Image.file(_image!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 10,
                      //right: 38,
                    ),
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: 310,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1D98C4),
                          Color(0xff1D60C4),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        getImage3();
                      },
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: (_image3 == null)
                            ? const Icon(
                                Icons.camera_alt_sharp,
                                size: 94,
                                color: Colors.black38,
                              )
                            : Image.file(_image3!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high),
                      ),
                    ),
                  ),

                  //Foto 3
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 10,
                      //right: 38,
                    ),
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: 310,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1D98C4),
                          Color(0xff1D60C4),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        getImage4();
                      },
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: (_image4 == null)
                            ? const Icon(
                                Icons.camera_alt_sharp,
                                size: 94,
                                color: Colors.black38,
                              )
                            : Image.file(_image4!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high),
                      ),
                    ),
                  ),

                  //Foto 4
                  Container(
                    margin: const EdgeInsets.only(
                      //top: getVerticalSize(top),
                      left: 10,
                      //right: 38,
                    ),
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: 310,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff1D98C4),
                          Color(0xff1D60C4),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        getImage5();
                      },
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: (_image5 == null)
                            ? const Icon(
                                Icons.camera_alt_sharp,
                                size: 94,
                                color: Colors.black38,
                              )
                            : Image.file(_image5!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(13),
        ),
        //ContainerSteps(),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 38,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  //top: getVerticalSize(top),
                  right: 85,
                ),
                child: Text(
                  "Foto etiqueta",
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: getFontSize(14),
                      fontFamily: 'Inter-Medium'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                //top: getVerticalSize(top),
                left: 10,
                //right: 38,
              ),
              width: MediaQuery.of(context).size.height * 0.35,
              height: 310,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff1D98C4),
                    Color(0xff1D60C4),
                  ],
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  getImage1();
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: (_image1 == null)
                      ? const Icon(
                          Icons.camera_alt_sharp,
                          size: 94,
                          color: Colors.black38,
                        )
                      : Image.file(_image1!,
                          fit: BoxFit.cover, filterQuality: FilterQuality.high),
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: getVerticalSize(56),
        ),
        //Botão para finalizar o Processo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: getHorizontalSize(90),
              height: getVerticalSize(50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shape: const StadiumBorder(),
                  primary: const Color(0xFF1D98C4),
                  shadowColor: const Color(0xFF1D98C4),
                  elevation: 9,
                ),
                onPressed: () {
                  var nip = int.parse(controller.nipController.value);

                  List<TabImagens> imagens = [
                    TabImagens(
                        IDNip: nip,
                        imagem: img64.toString(),
                        Status: 0,
                        lastUpdate: DateTime.now().toString()),
                    TabImagens(
                        IDNip: nip,
                        imagem: img64_2.toString(),
                        Status: 0,
                        lastUpdate: DateTime.now().toString()),
                    TabImagens(
                        IDNip: nip,
                        imagem: img64_3.toString(),
                        Status: 0,
                        lastUpdate: DateTime.now().toString()),
                    TabImagens(
                        IDNip: nip,
                        imagem: img64_4.toString(),
                        Status: 0,
                        lastUpdate: DateTime.now().toString()),
                    TabImagens(
                        IDNip: nip,
                        imagem: img64_1.toString(),
                        Status: 0,
                        lastUpdate: DateTime.now().toString())
                  ];
                  CadastroController()
                      .postImagens(imagens)
                      .then((value) => print("Fotos Cadastradas"));
                  setState(() {
                    avancar = false;
                    CadastroController().createBackupBD();
                 
                  });

                  print(agora.year.toString());
                  print(
                      "$obs_,\n $fornecedor_,\n $preco_, $marca_,\n $numSerie_,\n $selectedCat, $selectedLocale, $selectedConserva");
                },
                child: Text(
                  'Submeter',
                  style: TextStyle(
                    fontSize: getFontSize(16),
                    fontFamily: 'Inter-ExtraLight',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  //Fim funcao campos de fotos

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
            child: SingleChildScrollView(
              child: Container(
                  margin:
                      EdgeInsetsDirectional.only(top: getVerticalSize(34.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: (!avancar) ? camposEdicao() : fotos()),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: getVerticalSize(55)),
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
                      color: Colors.transparent,
                      size: 20,
                    ),
                  ),
                ),
                Image.asset(
                  ImageConstant.logoSetic,
                  fit: BoxFit.fill,
                  // height: 80,
                  width: getHorizontalSize(160),
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
                  '',
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
