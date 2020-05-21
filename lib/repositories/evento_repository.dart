import 'package:my_event/models/evento_model.dart';
import 'package:my_event/view-models/evento_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class EventoRepository {
  static String url_production = "https://tranquil-earth-03232.herokuapp.com";

  String url_event_code =
      url_production + "/users_backoffice/eventos/evento?code=";

  String url_programacao =
      url_production + "/users_backoffice/eventos/programacao?id=";

  Future<EventoModel> buscaEventoPorCodigo(EventoViewModel model) async {
    try {
      http.Response response = await http.get(url_event_code + model.codigo);
      if (response.statusCode != 500) {
        Map<String, dynamic> eventoJson = json.decode(response.body);
        EventoModel evento = EventoModel.fromJson(eventoJson);
        return evento;
      } else {
        model.msg_erro = 'Código inválido';
        return null;
      }
    } catch (e) {
      model.msg_erro = 'Erro ao Carregar Dados :(';
      return null;
    }
  }
}
