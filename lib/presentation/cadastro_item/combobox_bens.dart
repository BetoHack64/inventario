import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventario/model/inventario.dart';
import '../../main.dart';
import '../../utils/math_utils.dart';


class ClassifBens extends StatefulWidget {
  List<TabClassifiacaoBens> bens;
  String selectedC ;
  ClassifBens(this.bens,this.selectedC);
  @override
  State<ClassifBens> createState() => _ClassifBens();
}

class _ClassifBens extends State<ClassifBens> {
  List<TabClassifiacaoBens> bens2 = [];
  String selectedCat = '0';
  @override
  void setState(VoidCallback fn) {
   // Get.forceAppUpdate();
    selectedCat = widget.selectedC;
    widget.bens;
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      //focusNode:viagemController.,
      hint: const Center(
        child: Text(
          'Selecione o estado',
          style: TextStyle(color: Colors.white),
        ),
      ),
      value: selectedCat,
      items: getCombo(),
      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
      iconSize: 25,
      isExpanded: true,
      underline: Container(),
      onChanged: (String? selectedValue) => {
        if (selectedValue is String)
          {
            setState(() {
              selectedCat = selectedValue;
              controller.idClassifBens.value = int.parse(selectedCat);
            })
          }
      },
    );
  }

  List<DropdownMenuItem<String>>? getCombo() {
    List<DropdownMenuItem<String>>? listCat = [];
    setState(() {
      print(widget.bens);
      listCat = [
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
        for (var i = 0; i < widget.bens.length; i++)
          DropdownMenuItem<String>(
            value: widget.bens[i].idClassifBens.toString(),
            child: Text(
              widget.bens[i].descricao.toString(),
              style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: getFontSize(12),
                  fontFamily: 'Inter-Medium'),
            ),
          )
      ];
    });

    return listCat;
  }
}
