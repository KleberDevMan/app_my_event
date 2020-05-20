import 'package:mobx/mobx.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

part 'eventoController.g.dart';

class EventoController = _EventoControllerBase with _$EventoController;

abstract class _EventoControllerBase with Store {
  // static String url = "http://10.0.2.2:3000";
  static String url_production = "https://tranquil-earth-03232.herokuapp.com";

  String url_event_code =
      url_production + "/users_backoffice/eventos/evento?code=";

  String url_programacao =
      url_production + "/users_backoffice/eventos/programacao?id=";

  @observable
  Map<String, dynamic> eventoData = null;

  @observable
  Map<String, dynamic> programacaoEvento = null;

  @observable
  bool codeIsValid = null;

  @observable
  bool isLoading = false;

  @action
  buscarEventoPorCodigo(String value) async {
    isLoading = true;

    try {
      http.Response response = await http.get(url_event_code + value);
      if (response.statusCode != 500) {
        codeIsValid = true;
        eventoData = json.decode(response.body);
      }else{
        codeIsValid = false;
      }
    } catch (e) {
      codeIsValid = false;
      print(e);
    }

    isLoading = false;
  }

  // @computed
  // get qtdDias {
  //   return programacaoEvento.map((d) => d['data']).toList();
  // }

  @action
  buscarProgramacao() async {
    // isLoading = true;

    // try {
    //   http.Response response = await http.get(url_programacao + "${eventoData['id']}");
    //   programacaoEvento = json.decode(response.body);
    // } catch (e) {
    //   codeIsValid = false;
    //   print(e);
    // }

    try {
      http.Response response =
          await http.get(url_programacao + "${eventoData['id']}");
      return json.decode(response.body);
    } catch (e) {
      print(e);
      return null;
    }

    // isLoading = false;
  }
}
