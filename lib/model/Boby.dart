class BobyRequest {
  Cabecalho? cabecalho;

  BobyRequest({this.cabecalho});

  BobyRequest.fromJson(Map<String, dynamic> json) {
    cabecalho = json['Cabecalho'] != null
        ? new Cabecalho.fromJson(json['Cabecalho'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cabecalho != null) {
      data['Cabecalho'] = this.cabecalho!.toJson();
    }
    return data;
  }
}

class Cabecalho {
  String dataHora = DateTime.now().toString();
  String iDExterno = "123" ;
  String sistema = "SGP";
  String canal = "IB";
  bool validador = false;

  Cabecalho(
      this.dataHora,
      this.iDExterno,
      this.sistema,
      this.canal,
      this.validador);

  Cabecalho.fromJson(Map<String, dynamic> json) {
    dataHora = json['DataHora'];
    iDExterno = json['IDExterno'];
    sistema = json['Sistema'];
    canal = json['Canal'];
    validador = json['Validador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataHora'] = this.dataHora;
    data['IDExterno'] = this.iDExterno;
    data['Sistema'] = this.sistema;
    data['Canal'] = this.canal;
    data['Validador'] = this.validador;
    return data;
  }
}
