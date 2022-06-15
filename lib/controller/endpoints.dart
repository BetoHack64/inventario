
import 'package:inventario/controller/constants.dart';

enum endpoints{
  allCategories,
  allLocalization,
  allClassicacao,
  allEstadoConservacao,
  allEstadoUso,
  allTecnologia,
  allCors,
  allModelos,
  allMarcas,
  allFuncionarios,
}

extension endpointsExtension on endpoints {
  String? get endpoint {
    switch (this) {
      case endpoints.allCategories:
        return '${Constants().apiBaseUrl}/DevolveCategorias';
      case endpoints.allModelos:
        return '${Constants().apiBaseUrl}/DevolveModelos';
      case endpoints.allMarcas:
        return '${Constants().apiBaseUrl}/DevolveMarcas';
      case endpoints.allLocalization:
        return '${Constants().apiBaseUrl}/DevolveLocalizacao';
      case endpoints.allTecnologia:
        return '${Constants().apiBaseUrl}/DevolveTecnologia';
      case endpoints.allCors:
        return '${Constants().apiBaseUrl}/DevolveCores';
      case endpoints.allEstadoUso:
        return '${Constants().apiBaseUrl}/DevolveEstadoUso';
      case endpoints.allEstadoConservacao:
        return '${Constants().apiBaseUrl}/DevolveEstadoConservacao';
      case endpoints.allClassicacao:
        return '${Constants().apiBaseUrl}/DevolveClassificacaoBens';
      case endpoints.allFuncionarios:
        return '${Constants().apiBaseUrl}/DevolveFuncionarios';
    }
  }
}