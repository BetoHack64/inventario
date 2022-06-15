import 'package:flutter/material.dart';
import 'package:inventario/controller/constants.dart';
import 'package:inventario/controller/controller.dart';
import 'package:inventario/main.dart';

import '../../utils/math_utils.dart';

List<DropdownMenuItem<String>>? listaLocais = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
  /*for(var i =0; i<controller.localizacao.length;i++)
    DropdownMenuItem<String>(
      value: controller.localizacao[i].IDLocalizacao.toString(),
      child: Text(
        controller.localizacao[i].descricao.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),*/
  ];
//Menu Classe do Bem
  List<DropdownMenuItem<String>>? listCat = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
   /* for(var i =0; i<controller.templets.length;i++)
    DropdownMenuItem<String>(
      value: controller.templets[i].idClassifBens.toString(),
      child: Text(
        controller.templets[i].descricao.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),

    ),*/

  ];

  //Menu Classe do Bem
  List<DropdownMenuItem<String>>? listCat2 = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
   /* for(var i =0; i<controller.categorys.length;i++)
    DropdownMenuItem<String>(
      value: controller.categorys[i].ID.toString(),
      child: Text(
        controller.categorys[i].descricao.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),*/
  ];
  //Menu Classe do Bem
  List<DropdownMenuItem<String>>? listaCores = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
    DropdownMenuItem<String>(
      value: 'Preto',
      child: Text(
        'Preto',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Azul',
      child: Text(
        'Azul',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Cinzento',
      child: Text(
        'Cinzento',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Branco',
      child: Text(
        'Branco',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'Castanho',
      child: Text(
        'Castanho',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    )
  ];

List<DropdownMenuItem<String>>? listaEstadoUso = [
  DropdownMenuItem<String>(
    value: '0',
    child: Text(
      'Escolha a opção',
      style: TextStyle(
          color: Colors.blue[700],
          fontSize: getFontSize(12),
          fontFamily: 'Inter-Medium'),
    ),
    enabled: false,
  ),
  /*for(var i =0; i<controller.estadoUso.length;i++)
    DropdownMenuItem<String>(
      value: controller.estadoUso[i].idUso.toString(),
      child: Text(
        controller.estadoUso[i].descricao.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),*/

];

  List<DropdownMenuItem<String>>? listaEstadoCons = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
   /* for(var i =0; i<controller.estadoConservasao.length;i++)
    DropdownMenuItem<String>(
      value: controller.estadoConservasao[i].IDConservBens.toString(),
      child: Text(
        controller.estadoConservasao[i].descricao.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),*/

  ];

  //Lista de Marcas
  List<DropdownMenuItem<String>>? listMarcas = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
    DropdownMenuItem<String>(
      value: 'arc00',
      child: Text(
        'Arc 000',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: 'arc002',
      child: Text(
        'Arc 002',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    )
  ];
  //Menu Classe do Bem
  List<DropdownMenuItem<String>>? listModelos = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
    DropdownMenuItem<String>(
      value: 'm002',
      child: Text(
        'Modelo 000',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),
    DropdownMenuItem<String>(
      value: '001',
      child: Text(
        'Modelo 001',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    )
  ];

  List<DropdownMenuItem<String>>? listaUtilizadores = [
    DropdownMenuItem<String>(
      value: '0',
      child: Text(
        'Escolha a opção',
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
      enabled: false,
    ),
    /*for(var i =0; i<controller.funcionarios.length;i++)
    DropdownMenuItem<String>(
      value: controller.funcionarios[i].IDFuncionario.toString(),
      child: Text(
        controller.funcionarios[i].name.toString(),
        style: TextStyle(
            color: Colors.blue[700],
            fontSize: getFontSize(12),
            fontFamily: 'Inter-Medium'),
      ),
    ),*/
  ];
 //- 'Fim das Combos'  -