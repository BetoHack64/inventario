// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_is_empty, unnecessary_this

import 'dart:io';

import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:inventario/presentation/cadastro_item/impressao/auxiliar.dart';
import 'package:inventario/presentation/cadastro_item/impressao/teste.dart';
import 'package:inventario/presentation/cadastro_item/impressao/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintModal extends StatefulWidget {
  String qrcod = "12345678";
  PrintModal(String nip) {
    qrcod = nip;
  }
  @override
  _PrintModalState createState() => _PrintModalState();
}

class _PrintModalState extends State<PrintModal> {
  //String qrcod = "12345678";
  bool connected = false;
  List availableBluetoothDevices = [];
  String macAd = "00:15:0E:E6:FE:33";

  Future<void> getBluetooth() async {
    final List? bluetooths = await BluetoothThermalPrinter.getBluetooths;
    print("Imprimir $bluetooths");
    setState(() {
      //Pegar disp. getBluetooth
      availableBluetoothDevices = bluetooths!;
    });
  }

  Future<void> setConnect(String mac) async {
    final String? result = await BluetoothThermalPrinter.connect(mac);
    print("Estado da conexão $result");
    if (result == "true") {
      setState(() {
        connected = true;
      });
    }
  }

  Future<void> printGraphics() async {
    String? isConnected = await BluetoothThermalPrinter.connectionStatus;
    if (isConnected == "true") {
      List<int> bytes = await getGraphicsTicket();
      final result = await BluetoothThermalPrinter.writeBytes(bytes);

      print("Imprimir $result");
    } else {
      //Hadnle Not Connected Senario
    }
  }

  Future<List<int>> getGraphicsTicket() async {
    List<int> bytes = [];

    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    // Print QR Code using native function
    //bytes += generator.qrcode('silvioangelico');
    //String qrData = "00212332121";
    const double qrSize = 170;

    try {
      final uiImg = await QrPainter(
        data: widget.qrcod,
        version: QrVersions.auto,
        gapless: false,
      ).toImageData(qrSize);
      final bytes1 = await Utils.capture(key1);
      final dir = await getTemporaryDirectory();
      final pathName = '${dir.path}/qr_tmp.png';
      final qrFile = File(pathName);
      final imgFile = await qrFile.writeAsBytes(bytes1!.buffer.asUint8List());
      final img = decodeImage(imgFile.readAsBytesSync());

      generator.image(img!);
      bytes += generator.image(img);
      generator.feed(2);
      generator.cut();
      bytes += generator.row([
        PosColumn(),
      ]);
    } catch (e) {
      print(e);
    }

    return bytes;
  }

  //Define a impressora que sera utilizada
  void defImpressora(String mac) {
    this.setConnect(mac);
    if (connected) {
      this.printGraphics;
    } else {
      print("Não foi possivel");
    }
  }//

  ///////////////////----------------------
  @override
  void initState() {
    super.initState();
    this.getBluetooth();
     setState(() {
        connected = true;
      });
    defImpressora(macAd);
  }

  late GlobalKey key1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imprimir código Qr '),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Procurar dispositivos Bluetooth emparelhados"),
            TextButton(
              onPressed: () {
                // this.getBluetooth();
              },
              child: const Text("Pesquisar"),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: availableBluetoothDevices.length > 0
                    ? availableBluetoothDevices.length
                    : 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      String select = availableBluetoothDevices[index];
                      List list = select.split("#");
                      // String name = list[0];
                      String mac = list[1];
                      macAd = mac;
                      this.setConnect(mac);
                    },
                    leading: const Icon(Icons.print),
                    title: Text('${availableBluetoothDevices[index]}'),
                    subtitle: Text("Clica para conectar $index"),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: connected ? this.printGraphics : null,
              child: const Text("Imprimir"),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetToImage(builder: (key) {
                    key1 = key;
                    return Auxiliar(qrcode: widget.qrcod);
                  }),
                  const Text(
                      "IMPRIMA ESTE QR SELECIONANDO A IMPRESSORA\n E CLICANDO EM IMPRIMIR APOS O TEXTO(Imprimir)\n FICAR AZUL...")
                ],
              ),
            )
            /* TextButton(
                onPressed: connected ? this.printTicket : null,
                child: const Text("Imprimir Ticket"),
              ),*/
          ],
        ),
      ),
    );
  }
}
