import 'package:inventario/controller/ApiController.dart';
import 'package:inventario/controller/controller.dart';
import 'package:inventario/controller/controller_database.dart';
import 'package:inventario/model/inventario.dart';

class LoginController{
 Future<List<TabUsar>> testInsert(name,senha) async{
    List<TabUsar> user = await DatabaseContriller().getUsuario(name, senha);
    return user;
  }
}