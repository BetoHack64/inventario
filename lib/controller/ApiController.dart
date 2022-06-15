import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inventario/controller/constants.dart';
import 'package:inventario/controller/endpoints.dart';
import 'package:inventario/model/Boby.dart';
import 'package:inventario/model/categoria.dart';
import 'package:inventario/model/inventario.dart';

class ApiController {

  postAllCategories() async {
    List<TabCategorys> categorys ;
    try {
      var body = ({
        "Cabecalho": {
        "DataHora": "2022-05-27T14:12:22.4932361+01:00",
        "IDExterno": "123",
        "Sistema": "SGP",
        "Canal": "IB",
        "Validador": false
        }
      });
       print(body);
      var response = await http.post(
          Uri.parse(endpoints.allCategories.endpoint!),
           headers: Constants().RequestHeader,
           body: jsonEncode(body) );
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Categoria categoria = Categoria.fromJson(json);
       print("============${categoria.respostaServico!.lista![0].text}");
       
      } else {
        print(response.body);
      }
    } on SocketException {

    } catch (e) {
      print(e);
    }
  }
}

