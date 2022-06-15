class Localizacao {
  Cabecalho? cabecalho;
  RespostaServico? respostaServico;

  Localizacao({this.cabecalho, this.respostaServico});

  Localizacao.fromJson(Map<String, dynamic> json) {
    cabecalho = json['Cabecalho'] != null
        ? new Cabecalho.fromJson(json['Cabecalho'])
        : null;
    respostaServico = json['RespostaServico'] != null
        ? new RespostaServico.fromJson(json['RespostaServico'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cabecalho != null) {
      data['Cabecalho'] = this.cabecalho!.toJson();
    }
    if (this.respostaServico != null) {
      data['RespostaServico'] = this.respostaServico!.toJson();
    }
    return data;
  }
}

class Cabecalho {
  String? dataHora;
  String? iDExterno;
  String? mensagemErro;

  Cabecalho({this.dataHora, this.iDExterno, this.mensagemErro});

  Cabecalho.fromJson(Map<String, dynamic> json) {
    dataHora = json['DataHora'];
    iDExterno = json['IDExterno'];
    mensagemErro = json['MensagemErro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataHora'] = this.dataHora;
    data['IDExterno'] = this.iDExterno;
    data['MensagemErro'] = this.mensagemErro;
    return data;
  }
}

class RespostaServico {
  List<Lista>? lista;

  RespostaServico({this.lista});

  RespostaServico.fromJson(Map<String, dynamic> json) {
    if (json['Lista'] != null) {
      lista = [];
      json['Lista'].forEach((v) {
        lista!.add(new Lista.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lista != null) {
      data['Lista'] = this.lista!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lista {
  int? value;
  String? text;

  Lista({this.value, this.text});

  Lista.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Value'] = this.value;
    data['Text'] = this.text;
    return data;
  }
}
