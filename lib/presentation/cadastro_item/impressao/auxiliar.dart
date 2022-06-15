import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inventario/presentation/cadastro_item/impressao/teste.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Auxiliar extends StatefulWidget {
  late String qrcode;
  Auxiliar({Key? key, required this.qrcode}) : super(key: key);

  @override
  State<Auxiliar> createState() => _AuxiliarState();
}

class _AuxiliarState extends State<Auxiliar> {
  late GlobalKey key1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 200,
      height: 150,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Image.asset(
              "assets/images/setic_logo.png",
              scale: 5,
              color: Color(0xff000000),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:15, top:25),
            child: QrImage(
              data: widget.qrcode,
              version: QrVersions.auto,
              size: 80,
              gapless: false,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 100, left: 20),
              child: Text(
                "2022010000001",
                style: TextStyle(
                    fontFamily: "Opens Sans", fontWeight: FontWeight.bold,fontSize: 10),
              ))
        ],
      ),
    );
  }

  static Widget buildImage(Uint8List bytes) =>
      bytes != null ? Image.memory(bytes) : Container();
}
