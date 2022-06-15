
import 'dart:ffi';

final String tableTodo = 'todo';
final String columnId = 'id';
final String columnIdUser = 'idUser';
final String columnTitle = 'descricao';
final String columnCodigo = 'codigoserie';
final String columnUsuario = 'usuario';
final String columnNtable = 'ntablet';
final String columnSenha = 'senha';
final String columnLastUpdate = 'lastUpdate';

class TabCategorys {
   int ID;
   String descricao;
   int Status;
   String lastUdate;

  TabCategorys({this.ID = 0, this.descricao = "", this.Status = 0, this.lastUdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'Categ_Descricao': descricao,
      'Status': Status,
      'lastUpdate':lastUdate
    };
    return map;
  }

  @override
  String toString() {
    return 'TabCategorys{$ID, $descricao,$Status,$lastUdate}';
  }
}

class TabUsar {
   int IdUser;
   String usuario;
   String senha ;
   int ntablet ;

  TabUsar({this.IdUser =0 ,this.usuario="", this.senha="", this.ntablet=0});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnUsuario: usuario,
      columnSenha: senha,
      columnNtable: ntablet,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabUsar{$usuario,$senha,$ntablet}';
  }
}

class TabEstadoUso {
   int idUso;
   int codigo;
   String descricao;
   int Status;
   String lastUpdate;

  TabEstadoUso({this.idUso = 0, this.codigo =0, this.descricao ="", this.Status= 0, this.lastUpdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'Codigo': codigo,
      'descricao': descricao,
      'Status': Status,
      columnLastUpdate:lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabEstadoUso{$idUso,$codigo $descricao,$Status, $lastUpdate}';
  }
}

class TabEstadoConservacao {
  int IDConservBens;
  int codigo;
  String descricao;
  int Status;
  String lastUpdate;

  TabEstadoConservacao({this.IDConservBens =0, this.codigo = 0, this.descricao = "", this.Status = 0, this.lastUpdate =""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'CodBens' : codigo,
      'descricao': descricao,
      'Status': Status,
      columnLastUpdate: lastUpdate
    };
    return map;
  }

  @override
  String toString() {
    return 'TabEstadoConservacao{$IDConservBens,$codigo, $descricao, $Status, $lastUpdate}';
  }
}

class TabLocalizacao {
  int IDLocalizacao;
  int IDLocalizacaoPai;
  String Codigo;
  int UltimoNivel;
  String descricao;
  String morada;
  String pais;
  String provincia;
  String municipio;
  String localidade;
  int andar;
  int porta;
  String lastUpdate;
  int Status;

  TabLocalizacao(
      { this.IDLocalizacao = 0,
        this.IDLocalizacaoPai =0,
      this.Codigo = "",
      this.UltimoNivel = 0,
      this.descricao = "",
      this.morada = "",
      this.porta = 0,
      this.andar = 0,
      this.localidade = "",
      this.pais = "",
      this.provincia = "",
      this.municipio = "",
      this.lastUpdate = "",
      this.Status = 0});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'IDLocalizacaoPai': IDLocalizacaoPai,
      'Codigo': Codigo,
      'UltimoNivel': UltimoNivel,
      'descricao': descricao,
      'morada': morada,
      'porta': porta,
      'andar': andar,
      'localidade': localidade,
      'Pais': pais,
      'provincia': provincia,
      'municipio': municipio,
      columnLastUpdate: lastUpdate,
      'Status' : Status,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabLocalizacao{$IDLocalizacao, $IDLocalizacaoPai, $Codigo,$UltimoNivel, $descricao,$morada,$porta,$andar, $localidade,$pais,$provincia,$municipio, $lastUpdate,$Status}';
  }
}

class TabClassifiacaoBens{
  int idClassifBens;
  int IDCategory;
  String descricao;
  int Status;
  String lastUpdate;


  TabClassifiacaoBens(
      {this.idClassifBens = 0,
        this.IDCategory = 0,
      this.descricao = "",
      this.Status = 0,
      this.lastUpdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'IDCategory': IDCategory,
      'descricao': descricao,
      'Status': Status,
      columnLastUpdate: lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabClassifiacaoBens{$idClassifBens,$IDCategory, $descricao,$Status,$lastUpdate}';
  }

}

class TabFuncionarios{
  int IDFuncionario;
  int NumFuncionario;
  String name;
  int Status;
  String lastUpdate;


  TabFuncionarios(
      {this.IDFuncionario = 0,
      this.NumFuncionario = 0,
       this.name = "",
        this.lastUpdate = "",
      this.Status = 0});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'NumFuncionario': NumFuncionario,
      'name': name,
      'Status': Status,
      columnLastUpdate: lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabFuncionarios{$IDFuncionario,$NumFuncionario,$name, $Status,$lastUpdate}';
  }

}
class TabMarca{
  int idMarca;
  int IDCategory;
  String descricao;
  int Status;
  String lastUpdate;
  TabMarca(
      {this.idMarca = 0,
        this.IDCategory = 0,
      this.descricao = "",
      this.Status = 0,
      this.lastUpdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'IDCategory':IDCategory,
      'descricao': descricao,
      'Status': Status,
      columnLastUpdate: lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabMarca{$idMarca,$descricao,$Status,$lastUpdate}';
  }
}

class TabModelo{
  int idModelo;
  int MarcaID;
  String descricao;
  int Status;
  String lastUpdate;
  TabModelo(
      {this.idModelo = 0,
        this.MarcaID = 0,
        this.descricao = "",
        this.Status = 0,
        this.lastUpdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'IDMarca': MarcaID,
      'descricao': descricao,
      'Status': Status,
      columnLastUpdate: lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabModelo{$idModelo,$MarcaID, $descricao,$Status,$lastUpdate}';
  }
}

class TabInventario {
   String nip;
   int idLocalBens;
   int idCategory;
   int idClassifBens;
   String descricao;
   String anoAquisicao;
   String fornecedor;
    int idEstadoUso ;
   int idEstadoConservacao;
   String utilizadorBem;
   String observacoes;
   int idMarca;
   int idModelo;
   String anoFabrico;
   int numSerie;
   String tecnolog;
   String cor;
   int idUser;
   String lastUpdate;
   int Status;

  TabInventario(
      {this.nip = "",
      this.idLocalBens = 0,
      this.idCategory = 0,
      this.idClassifBens = 0,
      this.utilizadorBem = "",
      this.descricao = "",
      this.idMarca = 0,
      this.idModelo = 0,
      this.numSerie = 0,
        this.tecnolog = "",
        this.cor = "",
      this.anoAquisicao = "",
      this.anoFabrico = "",
      this.fornecedor = "",
      this.idEstadoUso = 0,
      this.idEstadoConservacao = 0,
      this.observacoes = "",
      this.idUser = 0,
      this.lastUpdate = "",
      this.Status = 0});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'nip': nip,
      'IDLLocalizacao': idLocalBens,
      'IDCategoty': idCategory,
      'IDClassifBens':idClassifBens,
      'utilizadorBem': utilizadorBem,
      'descricao': descricao,
      'IDMarca': idMarca,
      'IDModelo': idModelo,
      'numSerie': numSerie,
      'tecnolog': tecnolog,
      'cor': cor,
      'anoAquisicao': anoAquisicao,
      'anoFabrico': anoFabrico,
      'fornecedor': fornecedor,
      'idEstadoUso': idEstadoUso,
      'idEstadoConsevacao': idEstadoConservacao,
      'observacao': observacoes,
      'idUser': idUser,
      columnLastUpdate: lastUpdate,
      'Status': Status,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabInventario{$nip,$descricao,$idLocalBens,$anoAquisicao,$fornecedor,$idEstadoUso,$idEstadoConservacao,$observacoes,$utilizadorBem,$anoFabrico,$idModelo,$idMarca,$idCategory,$numSerie,$idUser,$lastUpdate}';
  }
}

class TabImagens{
  int id;
  int IDNip;
  String imagem;
  int Status;
  String lastUpdate;
  TabImagens(
      { this.id = 0,
        this.IDNip = 0,
        this.imagem = "",
        this.Status = 0,
        this.lastUpdate = ""});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      'ID_Nip': IDNip,
      'imagem': imagem,
      'Status': Status,
      columnLastUpdate: lastUpdate,
    };
    return map;
  }

  @override
  String toString() {
    return 'TabModelo{$id,$IDNip, $imagem,$Status,$lastUpdate}';
  }
}
