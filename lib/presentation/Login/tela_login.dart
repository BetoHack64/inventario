import 'package:flutter/material.dart';
import 'package:inventario/controller/shared_preferences.dart';
import 'package:inventario/presentation/Login/login_controller.dart';
import 'package:inventario/presentation/cadastro_item/controller_cadastro.dart';
import 'package:inventario/utils/image_constant.dart';
import 'package:inventario/utils/math_utils.dart';
import '../cadastro_item/tela_cadastro.dart';




class TelaLogin extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final email = TextEditingController();
  final password = TextEditingController();
  String email_ = "";
  String senha_ = "";
  int id = 0;
   typingData() {
  CadastroController().getEstadoConsevacao();
    setState(() {
    });
   }


  initState() {
    typingData();
    super.initState();
  }

  bool verifica() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(),
          decoration: const BoxDecoration(color: Colors.white70),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: getVerticalSize(650),
                // color: Colors.black,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/Group_20524.png", //fundo principal
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: getVerticalSize(75)),
                  width: getHorizontalSize(105),
                  child: Image.asset(
                    ImageConstant.logoSetic,
                    fit: BoxFit.fill,
                    // height: 80,
                    //width: getHorizontalSize(55),
                  ),
                ),
              ),

              Center(
                //Texto de Login no centro
                child: Container(
                  margin: EdgeInsets.only(top: getVerticalSize(229)),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: getFontSize(26),
                      fontFamily: 'Blinker',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              //Texto Login do centro
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //Aqui será definida a estrutura dos inputs da tela de login
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: getHorizontalSize(55),
                        left: getHorizontalSize(55),
                        top: getVerticalSize(284)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 0,
                            color: Color(0xfEEEEEEE)),
                      ],
                    ),
                    height: getVerticalSize(45),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          email_ = email;
                        },
                        // controller: BlocProvider.of<LoginBloc>(context).user,
                        style: TextStyle(
                          color: const Color(0xFF303030),
                          fontFamily: 'Blinker',
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(20),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            top: getVerticalSize(11),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Image.asset(
                              ImageConstant.userimg,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          hintText: 'nome',
                          hintStyle: const TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),

                  //Para senha
                  Container(
                    margin: EdgeInsets.only(
                        right: getHorizontalSize(55),
                        left: getHorizontalSize(55),
                        top: getVerticalSize(27)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 0,
                            color: Color(0xfEEEEEEE)),
                      ],
                    ),
                    height: getVerticalSize(45),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: TextField(
                        onChanged: (password) {
                          senha_ = password;
                        },
                        obscureText: true,
                        // controller: BlocProvider.of<LoginBloc>(context).user,
                        style: TextStyle(
                          color: const Color(0xFF303030),
                          // fontFamily: "openSans",
                          fontSize: getFontSize(20),
                          fontFamily: 'Blinker',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            top: getVerticalSize(11),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Image.asset(
                              ImageConstant.senhaimg,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          hintText: 'senha',
                          hintStyle: const TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                  //Final da tex e-mail

                  //Fim da text Senha

                  SizedBox(
                    height: getVerticalSize(47),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      right: getHorizontalSize(55),
                      left: getHorizontalSize(55),
                    ),
                    child: SizedBox(
                      height: getVerticalSize(50), //altura do button
                      //width: 150,

                      child: ElevatedButton(
                        onPressed: () {
                          LoginController().testInsert(email_, senha_).then((
                              value) {
                            if(value.length > 0) {
                              print(value[0]);
                              CacheController.setData(loggedKey, true);
                              CacheController.setData(idKey, value[0].IdUser);
                              CacheController.setData(nTableteKey, value[0].ntablet);
                              //Controllers.usar = value;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cad_inventario()),);
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cad_inventario()),);
                            }
                          });

                        },
                        child: Text(
                          'login',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Blinker',
                            //letterSpacing: 1.5,
                            fontSize: getFontSize(20),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: const Color(0xFF608EE9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: getVerticalSize(30)),

                  //Texto senha

                  //Sessão esqueci a senha
                  Center(
                    //Texto de Esqueceu a Senha?
                    child: GestureDetector(
                      onTap: () {
                        print('Recuperar a senha.');
                      },
                      child: Text(
                        'Esqueceu sua senha ?',
                        style: TextStyle(
                          fontSize: getFontSize(17),
                          color: Colors.white,
                          fontFamily: 'Blinker',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  //Texto ou
                  SizedBox(
                    height: getVerticalSize(110),
                  ),

                  SizedBox(
                    height: getVerticalSize(160),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nota:',
                        style: TextStyle(
                          color: const Color(0xFF7A7A7A),
                          fontSize: getFontSize(19),
                          fontFamily: 'Blinker',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        ' ao utilizar esta aplicação concorda com os termos',
                        style: TextStyle(
                          color: Colors.blue,
                          letterSpacing: 1.5,
                          fontSize: getFontSize(19),
                          fontFamily: 'Blinker',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
